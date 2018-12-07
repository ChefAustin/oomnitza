# frozen_string_literal: true
require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class LocationWorkflow < Oomnitza::Api::Base
      def self.base_endpoint
        '/workflows'
      end
    end
  end
end
