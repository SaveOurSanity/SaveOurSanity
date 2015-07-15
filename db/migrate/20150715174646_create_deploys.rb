class CreateDeploys < ActiveRecord::Migration
  def change
    create_table :deploys do |t|
      t.integer :environment_id
      t.datetime :time
      t.string :author

      t.timestamps null: false
    end
  end
end
