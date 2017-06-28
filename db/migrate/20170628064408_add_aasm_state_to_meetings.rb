class AddAasmStateToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :aasm_state, :string
  end
end
