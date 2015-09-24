class DeployServices::Php < DeployServices::Base

  protected

  def command
    "ssh -At php-user@#{url_stripped_http} '/opt/automata/php/deploy -b #{branch}'"
  end

  private

  def branch
    deploy.ruby_branch
  end

  def url_stripped_http
    environment.url.match(/^https?:\/\/(.*)$/)[1]
  end

end
