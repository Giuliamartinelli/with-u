class AddPrefixToAngels < ActiveRecord::Migration[6.0]
  def change
    add_column :angels, :prefix, :string
  end
end
