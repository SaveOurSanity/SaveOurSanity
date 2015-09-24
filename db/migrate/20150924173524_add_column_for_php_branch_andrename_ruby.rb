class AddColumnForPhpBranchAndrenameRuby < ActiveRecord::Migration
  def change
    add_column :deploys, :php_branch_name, :string
    rename_column :deploys, :branch_name, :ruby_branch_name
  end
end
