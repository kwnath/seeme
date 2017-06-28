class DeleteAasmstateToMeeting < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :aasm_state, :string
  end
end
