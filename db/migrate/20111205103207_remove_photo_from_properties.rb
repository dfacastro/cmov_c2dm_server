class RemovePhotoFromProperties < ActiveRecord::Migration
  def up
    remove_column :properties, :photo
  end

  def down
    add_column :properties, :photo, :string
  end
end
