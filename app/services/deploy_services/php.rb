class DeployServices::Php < DeployServices::Base

  protected

  def command
    "ssh -At php-user@#{url_stripped_http} '/opt/automata/php/deploy -b #{branch}'"
  end

  def platform
    :php
  end

  private

  def branch
    deploy.php_branch_name
  end

  def url_stripped_http
    environment.url.match(/^https?:\/\/(.*)$/)[1]
  end

end
