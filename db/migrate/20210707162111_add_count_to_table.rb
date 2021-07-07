class AddCountToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :count, :integer
  end
end
