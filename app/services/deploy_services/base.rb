class DeployServices::Base

  attr_accessor :environment
  attr_accessor :deploy

  def initialize(environment, deploy)
    self.environment = environment
    self.deploy = deploy
    deploy.update(log_file: log_file)
  end

  def start
    system "#{command} >#{log_file} 2>#{log_file}"
  end

  protected

  def command
    raise "override this"
  end

  private

  def log_file
    @log_file ||= "#{environment.name.downcase} #{Time.now.to_s}".gsub(" ", "_")
  end

end
