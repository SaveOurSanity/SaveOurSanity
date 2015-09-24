class DeployServices::Ruby < DeployServices::Base

  protected

  def command
    "bundle exec mina #{environment.name.downcase} branch=#{branch}"
  end

  private

  def branch
    deploy.ruby_branch
  end

end
