module Translinator
  class Textinator
    class << self
      def get(params)
        texts = JSON.parse(RestClient.get 'http://192.168.33.1:8000/search', params: params)
        Hash[texts.map { |key,value| [key.split('.').drop(3).join('.'), value] }].with_indifferent_access
      end
    end
  end
end