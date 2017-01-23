class CreateEstates < ActiveRecord::Migration[5.0]
  def change
    create_table :estates do |t|
      t.string :url
      t.string :name
      t.string :number
      t.string :email
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :size
      t.string :price

      t.timestamps
    end
  end
end
