class AddNameToNewsletters < ActiveRecord::Migration[5.1]
  def change
    add_column :newsletters, :name, :string
  end
end
