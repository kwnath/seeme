class Api::V1::MeetingsController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]

  def index
  end

  def show
  end

  def new
  end

  def create
  end
end
