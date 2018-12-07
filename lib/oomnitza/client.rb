# frozen_string_literal: true

module Oomnitza
  # Top-level module documentation comment
  module Client
    attr_accessor :tenant, :path, :api_key, :limit, :debug

    @@debug = nil
    @@tenant = nil
    @@api_key = nil
    @limit = nil

    def self.configure(tenant: nil, api_key: nil, limit: 500, debug: false)
      @@debug = debug
      @@tenant = tenant
      @@api_key = api_key
      @@limit = limit
      raise 'Please provide an API key.' unless @@api_key
      raise 'Please provide a tenant (tenant.oomnitza.com).' unless @@tenant

      return @@tenant, @@api_key
    end

    def http_get(endpoint)
      uri = uri_builder(endpoint)
      response = send_http_get(uri)
      response_x_total_count = response['x-total-count'].to_i
      response_x_total_count <= @@limit ? JSON.parse(response.body) : parse_query_response(endpoint, response_x_total_count)
    end

    def http_delete(endpoint)
      uri = uri_builder(endpoint)
      request = Net::HTTP::Delete.new(uri)
      request.content_type = 'application/json'
      request['Accept'] = 'application/json'
      req_options = { use_ssl: uri.scheme == 'https' }
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |web|
        web.request(request)
      end
      response.code.eql?("204") ? 'Success' : 'Delete returned non-204 response code'
    end

    def http_patch(endpoint, body)
      uri = uri_builder(endpoint)
      request = Net::HTTP::Patch.new(uri, body)
      request.content_type = 'application/json'
      request['Accept'] = 'application/json'
      req_options = { use_ssl: uri.scheme == 'https' }
      request.body = body.to_json
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |web|
        web.request(request)
      end
      JSON.parse(response.body)
    end

    def http_post(endpoint, body)
      uri = uri_builder(endpoint)
      request = Net::HTTP::Post.new(uri)
      request.content_type = 'application/json'
      request['Accept'] = 'application/json'
      req_options = { use_ssl: uri.scheme == 'https' }
      request.body = body.to_json
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |web|
        web.request(request)
      end
      JSON.parse(response.body)
    end

    def parse_query_response(endpoint, response_x_total_count)
      responses = []
      total_pages = count_pages(response_x_total_count)
      (0...total_pages).each do |c|
        uri = URI.parse("https://#{@@tenant}.oomnitza.com/api/v3#{endpoint}?" \
                        "limit=#{@@limit}&skip=#{c * @@limit}&api_key=#{@@api_key}")
        request = Net::HTTP::Get.new(uri)
        request.content_type = 'application/json'
        req_options = { use_ssl: uri.scheme == 'https' }
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |web|
          web.request(request)
        end
        responses.concat(JSON.parse(response.body))
      end
      responses
    end

    def count_pages(response_x_total_count)
      full_pages = response_x_total_count.to_f / @@limit
      full_pages.ceil.to_int
    end

    def send_http_get(uri)
      request = Net::HTTP::Get.new(uri)
      request.content_type = 'application/json'
      req_options = { use_ssl: uri.scheme == 'https' }
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |web|
        web.request(request)
      end
      response
    end

    def uri_builder(endpoint)
      URI.parse("https://#{@@tenant}.oomnitza.com/api/v3#{endpoint}?api_key=#{@@api_key}")
    end
  end
end
