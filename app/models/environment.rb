class Environment < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
