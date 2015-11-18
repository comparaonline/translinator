module Translinator
  class Textinator
    class << self
      def get(params)
        response = RestClient::Request.execute(
          method: :get,
          url: CoConfig::TEXTINATOR_API[:text_url],
          timeout: 10,
          open_timeout: 10
        )
        texts = JSON.parse(response)
        Hash[texts.map { |t| [t['key'], t['value']] }].with_indifferent_access
      rescue StandardError => e
        {}
      end
    end
  end
end