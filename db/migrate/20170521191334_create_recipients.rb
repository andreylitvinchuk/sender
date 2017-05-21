class CreateRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipients do |t|
      t.references :player, foreign_key: true
      t.references :newsletter, foreign_key: true
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end
