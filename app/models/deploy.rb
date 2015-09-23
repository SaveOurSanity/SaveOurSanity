class Deploy < ActiveRecord::Base
  validates :author, presence: true
  validates :branch_name, presence: true
  belongs_to :environment
end
