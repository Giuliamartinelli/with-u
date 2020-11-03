class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.string :lat
      t.string :long
      t.boolean :call
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
