class CreateNewsletters < ActiveRecord::Migration[5.1]
  def change
    create_table :newsletters do |t|
      t.text :text
      t.json :filters
      t.timestamp :start_at

      t.timestamps
    end
  end
end
