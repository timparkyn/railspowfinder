class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :code
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :stations, [:user_id, :created_at]
  end
end
