class CreateVerifications < ActiveRecord::Migration[6.0]
  def change
    create_table :verifications do |t|
      t.boolean :verified, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
