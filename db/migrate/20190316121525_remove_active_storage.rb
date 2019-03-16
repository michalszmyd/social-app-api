class RemoveActiveStorage < ActiveRecord::Migration[5.2]
  def change
    remove_column :active_storage_attachments, :blob_id
    execute('DELETE FROM active_storage_attachments')
    execute('DELETE FROM active_storage_blobs')
    drop_table :active_storage_blobs
    drop_table :active_storage_attachments
  end
end
