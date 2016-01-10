module Bootstrap
  class << self
    # Monkey patch out a whole bunch of stuff we don't want
    def load!
      configure_sass
    end
  end
end
