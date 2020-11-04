class AddSpiritToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_reference :cocktails, :spirit, foreign_key: true
  end
end
