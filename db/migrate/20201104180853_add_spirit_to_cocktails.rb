class AddSpiritToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :spirit, :string
  end
end
