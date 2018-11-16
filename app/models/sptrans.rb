module Sptrans
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Sptrans::Configuration.new
    yield(configuration)
  end
end
