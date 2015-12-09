module Translinator
  class Textinator
    class << self
      def texts(params)
        response = {}.t_s
        Timeout.timeout(CoConfig::TEXTINATOR_API[:request_timeout]) do
          response = RestClient.get(
            CoConfig::TEXTINATOR_API[:text_url],
            params: params
          )
        end
        JSON.parse(response).with_indifferent_access
      rescue StandardError => e
        {}
      end
    end
  end
end
