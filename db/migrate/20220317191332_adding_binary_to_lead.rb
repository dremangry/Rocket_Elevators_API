class AddingBinaryToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :attached_file_stored_as_binary, :binary
  end
end
