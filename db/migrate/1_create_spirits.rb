class CreateSpirits < ActiveRecord::Migration[6.0]
  def change
    create_table :spirits do |t|
      t.string :name
    end
  end
end
