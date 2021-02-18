class AddResidentToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :name, :string, null: false 
  end
end
