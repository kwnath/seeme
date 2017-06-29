require 'mina/bundler'
require 'mina/rails'
# require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)
require "mina/rsync"
require "mina/scp"

@root_path = '/var/www/seeme'

set :domain, 'wagon'
set :deploy_to, @root_path
# set :repository, 'https://github.com/kwnath/seeme.git'
set :branch, 'deploy'

set :rsync_options, %w[
  --recursive --delete --delete-excluded
  --exclude .git*
  --exclude /spec/***
]

# For system-wide RVM install.
set :rvm_path, '/usr/local/rvm/scripts/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/application.yml', 'log']
set :user, 'seeme'

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :"rvm:use[ruby-#{File.read('.ruby-version').chomp}]"
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  to :before_hook do
    # Put things to run locally before ssh
  end
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    # invoke :'git:clone'
    invoke :'rsync:deploy'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      queue "sudo supervisorctl restart seeme:seeme-web-1"
    end
  end
end

def sync_production_env
  scp_upload('config/application.yml', "#{@root_path}/shared/config/", verbose: true)
end

task :sync_env do
  sync_production_env
end
