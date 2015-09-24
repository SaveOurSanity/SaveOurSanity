class DeployServices::Ruby < DeployServices::Base

  protected

  def command
    "bundle exec mina #{environment.name.downcase} branch=#{branch}"
  end

  def platform
    :ruby
  end

  private

  def branch
    deploy.ruby_branch_name
  end

end
