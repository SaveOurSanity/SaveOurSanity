class RemoveLogFileFromDeploy < ActiveRecord::Migration
  def change
    remove_column :deploys, :log_file, :string
  end
end
