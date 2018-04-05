class CreateSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :selections do |t|
      t.references :user, foreign_key: true
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
