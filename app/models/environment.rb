class Environment < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false
  validates_format_of :url, :with => URI::regexp(%w(http https))
  has_many :deploys

  def last_deployed_ruby_branch
    deploys.last.try(:ruby_branch_name) || "n/a"
  end

  def last_deployed_php_branch
    deploys.last.try(:php_branch_name) || "n/a"
  end

end
