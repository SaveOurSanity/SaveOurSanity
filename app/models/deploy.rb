class Deploy < ActiveRecord::Base
  validates :author, presence: true
end
