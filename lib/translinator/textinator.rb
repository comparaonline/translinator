module Translinator
  class Textinator
    class << self
      def get(params)
        tries ||= 3
        response = RestClient::Request.execute(
          method: :get,
          url: 'http://192.168.33.1:3000/texts',
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