# frozen_string_literal: true
require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Activity < Oomnitza::Api::Base
      def self.base_endpoint
        '/activities'
      end
    end
  end
end
