module Bus
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Bus::Configuration.new
    yield(configuration)
  end
end
