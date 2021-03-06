# frozen_string_literal: true

require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Software < Oomnitza::Api::Base
      def self.base_endpoint
        '/software'
      end

      def self.id_attribute
        'software_id'
      end
    end
  end
end
