class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :name
      t.date :publish_date
      t.integer :price
      t.text :comment

      t.timestamps
    end
  end
end
