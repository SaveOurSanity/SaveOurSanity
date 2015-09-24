class DeployServices::Base

  attr_accessor :deploy

  def initialize(deploy)
    self.deploy = deploy
  end

  def start
    system "#{command} >#{deploy.log_file(platform)} 2>#{deploy.log_file(platform)} &"
  end

  protected

  def command
    raise "override this"
  end

  def platform
    raise "override this"
  end

  def environment
    deploy.environment
  end
end
