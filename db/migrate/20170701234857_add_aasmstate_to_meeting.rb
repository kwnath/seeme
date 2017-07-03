class AddAasmstateToMeeting < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :aasm_state, :string
  end
end
