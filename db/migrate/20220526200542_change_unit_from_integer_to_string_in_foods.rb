class ChangeUnitFromIntegerToStringInFoods < ActiveRecord::Migration[7.0]
  def up
    change_column :foods, :unit, :string
  end

  def down
    change_column :foods, :unit, :integer
  end
end
