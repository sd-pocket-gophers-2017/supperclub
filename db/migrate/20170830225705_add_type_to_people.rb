class AddTypeToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :type, :string, null: false
  end
end
