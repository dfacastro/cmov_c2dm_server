class AddPhotoFileNameToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :photo_file_name, :string
  end
end
