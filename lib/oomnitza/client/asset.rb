# frozen_string_literal: true

require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Asset < Oomnitza::Api::Base
      def self.base_endpoint
        '/assets'
      end

      def self.id_attribute
        'equipment_id'
      end
    end
  end
end
