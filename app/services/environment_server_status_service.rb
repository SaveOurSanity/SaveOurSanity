class EnvironmentServerStatusService
  attr_accessor :environment

  def initialize(environment)
    self.environment = environment
  end

  def check_status
    HTTPClient.new.get(environment.url).status_code
  end

  def self.run_all_environments
    Environment.all.each { |e| e.update(server_status: self.new(e).check_status) }
  end

end
