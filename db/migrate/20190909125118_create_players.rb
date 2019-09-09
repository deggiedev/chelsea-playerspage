class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :age
      t.string :position
      t.string :active

      t.timestamps
    end
  end
end
