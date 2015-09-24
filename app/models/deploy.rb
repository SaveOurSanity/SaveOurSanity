class Deploy < ActiveRecord::Base
  validates :author, presence: true
  validates :ruby_branch_name, presence: true
  validates :php_branch_name, presence: true
  belongs_to :environment

  before_create :deploy_the_branches!

  def deploy_the_branches!
    if environment.last_deployed_ruby_branch != ruby_branch_name
      DeployServices::Ruby.new(self).start
    end
    if environment.last_deployed_php_branch != php_branch_name
      DeployServices::Php.new(self).start
    end
  end

  def log_contents(platform)
    contents = `cat #{log_file(platform)}`
    unless contents.gsub("\n", "").present?
      contents = "No #{platform} log contents"
    end
    contents
  end

  def log_file(platform)
    "#{path}/#{platform}#{environment.name.downcase} #{created_at.to_s}.log".gsub(" ", "_")
  end

  private

  def path
    `pwd`.gsub("\n", "")
  end
end
