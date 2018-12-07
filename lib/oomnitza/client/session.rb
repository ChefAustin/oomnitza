# frozen_string_literal: true

require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Session < Oomnitza::Api::Base
      def self.base_endpoint
        '/sessions'
      end
    end
  end
end
