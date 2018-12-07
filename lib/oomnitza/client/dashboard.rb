# frozen_string_literal: true
require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Dashboard < Oomnitza::Api::Base
      def self.base_endpoint
        '/dashboards'
      end
    end
  end
end
