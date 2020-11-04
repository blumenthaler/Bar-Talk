class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.belongs_to :spirit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
