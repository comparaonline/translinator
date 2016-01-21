module Translinator
  class Textinator
    class << self

      def texts(request, search = {})
        fetch_texts({
          application: Rails.application.class.parent_name.downcase,
          countryCode: defined?(I18n) ? I18n.locale : :cl,
          url: request.original_fullpath
        }.merge(search))
      end

      private

      def fetch_texts(params)
        response = {}.to_s
        Timeout.timeout(CoConfig::TEXTINATOR_API[:request_timeout]) do
          response = RestClient.get(
            CoConfig::TEXTINATOR_API[:text_url],
            params: params
          )
        end
        JSON.parse(response).with_indifferent_access
      rescue StandardError => exception
        Rails.logger.error "Textinator error on fetching all texts:\n"\
        + " with params: #{params.inspect}\n"\
        + " #{exception.message}\n"\
        + exception.backtrace.join("\n")
        {}
      end

    end
  end
end
