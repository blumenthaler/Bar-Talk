class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :garnish
      t.text :notes
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :cocktail, null: false, foreign_key: true
      t.belongs_to :spirit, foreign_key: true
      t.timestamps
    end
  end
end
