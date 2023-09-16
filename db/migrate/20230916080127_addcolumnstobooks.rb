class Addcolumnstobooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :deleted_at, :datetime
    add_column :books, :cost_cents, :integer, :default => 0
    add_column :books, :price_cents, :integer, :default => 0
    add_column :books, :discount, :decimal
  end
end
