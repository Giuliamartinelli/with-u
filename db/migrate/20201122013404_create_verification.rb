class CreateVerification < ActiveRecord::Migration[6.0]
  def change
    create_table :verifications do |t|
      t.boolean :verified
      t.string :phone_number
      t.references :user, null: false, foreign_key: true
    end
  end
end
