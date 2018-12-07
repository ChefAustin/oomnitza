# frozen_string_literal: true
require 'oomnitza/client/base'

module Oomnitza
  module Api
    # Top-level class documentation comment
    class ConnectorRunLogs
      def connector_run_logs
        endpoint = '/connector_run_logs'
        http_get(endpoint)
      end

      def connector_run_log_by_id(id)
        endpoint = "/connector_run_logs/#{id}"
        http_get(endpoint)
      end

      def connector_run_logs_healthcheck
        endpoint = '/connector_run_logs/healthcheck'
        http_get(endpoint)
      end

      def connector_run_logs_healthcheck_meta
        endpoint = '/connector_run_logs/healthcheck/meta'
        http_get(endpoint)
      end

      def connector_run_logs_meta
        endpoint = '/connector_run_logs/meta'
        http_get(endpoint)
      end

      def connector_run_logs_savedsearches
        endpoint = '/connector_run_logs/savedsearches'
        http_get(endpoint)
      end

      def connector_run_logs_savedsearches_meta
        endpoint = '/connector_run_logs/savedsearches/meta'
        http_get(endpoint)
      end

      def connector_run_logs_searchsettings
        endpoint = '/connector_run_logs/searchsettings'
        http_get(endpoint)
      end

      def connector_run_logs_searchsettings_meta
        endpoint = '/connector_run_logs/searchsettings/meta'
        http_get(endpoint)
      end
    end
  end
end
