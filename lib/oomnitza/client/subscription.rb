# frozen_string_literal: true

require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Subscription < Oomnitza::Api::Base
      def self.base_endpoint
        '/subscriptions'
      end
    end
  end
end
