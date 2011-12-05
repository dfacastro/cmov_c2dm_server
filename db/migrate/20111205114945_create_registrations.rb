class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.text :name

      t.timestamps
    end
  end
end
