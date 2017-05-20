class CreateGameUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :game_users do |t|
      t.string :name
      t.string :vk_id
      t.integer :level
      t.timestamp :last_visit
      t.boolean :paid

      t.timestamps
    end
    add_index :game_users, :vk_id
  end
end
