class AddStationsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :selected, :array
  end
end
