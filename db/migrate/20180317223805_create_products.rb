class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :body
      t.date :creation_date

      t.timestamps
    end
  end
end
