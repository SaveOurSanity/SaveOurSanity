class ServerStatus < ActiveRecord::Migration
  def change
    add_column :environments, :server_status, :integer
  end
end
