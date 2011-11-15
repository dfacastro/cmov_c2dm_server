class AddBathroomsAndExtrasToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :bathrooms, :string
    add_column :properties, :extras, :string
  end
end
