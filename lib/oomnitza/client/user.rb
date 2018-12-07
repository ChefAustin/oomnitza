# frozen_string_literal: true

require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class User < Oomnitza::Api::Base
      def self.base_endpoint
        '/users'
      end

      def self.id_attribute
        'username'
      end
    end
  end
end
