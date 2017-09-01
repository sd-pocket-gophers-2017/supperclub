class AddSecretUrlToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :guest_link, :string, unique: true, null: false
  end
end
