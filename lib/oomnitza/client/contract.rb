# frozen_string_literal: true
require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Contract < Oomnitza::Api::Base
      def self.base_endpoint
        '/contracts'
      end

      def self.id_attribute
        'contract_id'
      end
    end
  end
end
