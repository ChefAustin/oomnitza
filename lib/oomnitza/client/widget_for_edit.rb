# frozen_string_literal: true
require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class WidgetForEdit < Oomnitza::Api::Base
      def self.base_endpoint
        '/widgets_for_edit'
      end
    end
  end
end
