module Translinator
  class Textinator
    class << self
      def get(params)
        texts = JSON.parse(RestClient.get('http://192.168.33.1:3000/texts', params: params))
        Hash[texts.map { |t| [t['key'], t['value']] }].with_indifferent_access
      end
    end
  end
end