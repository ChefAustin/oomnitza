# frozen_string_literal: true
require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Location < Oomnitza::Api::Base
      def self.base_endpoint
        '/locations'
      end

      def self.id_attribute
        'location_id'
      end
    end
  end
end
