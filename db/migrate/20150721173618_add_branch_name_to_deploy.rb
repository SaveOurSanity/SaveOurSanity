class AddBranchNameToDeploy < ActiveRecord::Migration
  def change
    add_column :deploys, :branch_name, :string
  end
end
