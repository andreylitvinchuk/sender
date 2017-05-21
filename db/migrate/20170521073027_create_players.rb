class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :vk_id
      t.integer :level
      t.timestamp :last_visit
      t.boolean :paid

      t.timestamps
    end
    add_index :players, :vk_id
  end
end
