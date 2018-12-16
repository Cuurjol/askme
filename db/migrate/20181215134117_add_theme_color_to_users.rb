class AddThemeColorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :theme_color, :string, default: '#005a55'
  end
end
