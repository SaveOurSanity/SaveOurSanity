class Deploy < ActiveRecord::Base
  validates :author, presence: true
  validates :ruby_branch_name, presence: true
  validates :php_branch_name, presence: true
  belongs_to :environment
end
