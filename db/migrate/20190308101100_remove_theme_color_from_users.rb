class RemoveThemeColorFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :theme_color, :string
  end
end
