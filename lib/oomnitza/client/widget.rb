# frozen_string_literal: true

require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Widget < Oomnitza::Api::Base
      def self.base_endpoint
        '/widgets'
      end

      def self.id_attribute
        'widgetId'
      end
    end
  end
end
