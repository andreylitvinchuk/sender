class AddErrorFieldToRecipient < ActiveRecord::Migration[5.1]
  def change
    add_column :recipients, :error, :boolean, default: false
  end
end
