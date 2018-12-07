# frozen_string_literal: true

require 'oomnitza/client'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class Base
      extend Oomnitza::Client

      def initialize(attributes)
        @attributes = attributes
        set_attributes
      end

      def base_endpoint
        self.class.base_endpoint
      end

      def self.base_endpoint; end

      def object_endpoint
        "#{base_endpoint}/#{@attributes[self.class.id_attribute]}"
      end

      def self.all
        result = http_get(base_endpoint)
        result.map { |r| self.new(r) }
      end

      def delete!
        self.class.http_delete(object_endpoint)
      end

      def self.delete(id)
        find(id).delete!
      end

      def modify!(params)
        self.class.http_patch(object_endpoint, params)
      end

      def self.modify(id, params)
        find(id).modify!(params)
      end

      def self.find(id)
        result = http_get("#{base_endpoint}/#{id}")
        self.new(result)
      end

      def self.meta
        http_get("#{base_endpoint}/meta")
      end

      def self.create(params)
        http_post("#{base_endpoint}", params)
      end

      def item_id
        "#{base_endpoint}/#{@attributes['id']}"
      end

      private

      def set_attributes
        @attributes.each do |name, value|
          instance_variable_set("@#{name}", value)
          self.class.send(:attr_accessor, name)
        end
      end
    end
  end
end
