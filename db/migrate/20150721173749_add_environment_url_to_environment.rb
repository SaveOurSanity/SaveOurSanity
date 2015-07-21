class AddEnvironmentUrlToEnvironment < ActiveRecord::Migration
  def change
    add_column :environments, :url, :string
  end
end
