class AddLogFileToDeploy < ActiveRecord::Migration
  def change
    add_column :deploys, :log_file, :string
  end
end
