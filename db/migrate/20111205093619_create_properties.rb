class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :photo
      t.string :kind
      t.string :address
      t.string :city
      t.string :rooms
      t.decimal :price, :precision => 15, :scale => 2
      t.boolean :for_sale

      t.timestamps
    end
  end
end
