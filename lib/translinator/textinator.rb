module Translinator
  class Textinator
    class << self
      def texts(params)
        response = {}.to_s
        Timeout.timeout(CoConfig::TEXTINATOR_API[:request_timeout]) do
          response = RestClient.get(
            CoConfig::TEXTINATOR_API[:text_url],
            params: params
          )
        end
        JSON.parse(response).with_indifferent_access
      rescue StandardError => exception
        Rails.logger.error "Textinator error on fetching all texts: with params:#{params.inspect}:"\
        + " #{exception.message}\n"\
        + exception.backtrace.join("\n")
        {}
      end
    end
  end
end
