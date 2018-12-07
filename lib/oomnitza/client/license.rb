# frozen_string_literal: true
require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class License < Oomnitza::Api::Base
      def self.base_endpoint
        '/licenses'
      end
    end
  end
end
