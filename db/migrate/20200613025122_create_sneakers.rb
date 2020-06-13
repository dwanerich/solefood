class CreateSneakers < ActiveRecord::Migration[6.0]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :description
      t.float :size
      t.float :price
      t.integer :user_id
      t.integer :brand_id
      t.string :comment

      t.timestamps
    end
  end
end
