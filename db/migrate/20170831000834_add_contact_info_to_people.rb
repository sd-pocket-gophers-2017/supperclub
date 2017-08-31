class AddContactInfoToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :last_name, :string, null: false
    add_column :people, :first_name, :string, null: false
    add_column :people, :phone, :string, null: false
  end
end
