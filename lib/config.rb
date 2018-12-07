# frozen_string_literal: true

# This is a top-level module documentation comment
module Oomnitza
  # This is a top-level module documentation comment
  module Config
    extend self

    attr_accessor :token
    attr_accessor :logger

    def reset
      self.token = nil
      self.logger = nil
    end

    reset
  end

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end
