module Translinator
  class Textinator
    class << self
      def texts(params)
        resource = RestClient::Resource.new(
          CoConfig::TEXTINATOR_API[:text_url],
          timeout: CoConfig::TEXTINATOR_API[:request_timeout],
          open_timeout: CoConfig::TEXTINATOR_API[:request_timeout]
        )
        response = resource.get(params: params)
        JSON.parse(response).with_indifferent_access
      rescue StandardError => e
        {}
      end
    end
  end
end
