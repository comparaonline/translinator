module Translinator
  class Textinator
    class << self
      TIMEOUT = 100

      def texts(params)
        father_path = params[:url]
        children_path(father_path).inject({}) do |texts, path|
          texts.merge(get_texts(params.merge(url: path)))
        end
      end

      def get_texts(params)
        resource = RestClient::Resource.new(CoConfig::TEXTINATOR_API[:text_url], timeout: TIMEOUT, open_timeout: TIMEOUT)
        response = resource.get(params: params)
        texts = JSON.parse(response)
        Hash[texts.map { |t| [t['key'], t['value']] }].with_indifferent_access
      rescue StandardError => e
        {}
      end

      def children_path(url)
        url = url.split('/')
        url.map.with_index { |u, i| url.dup.drop(i).reverse.join('/') }.reverse.drop(1)
      end
    end
  end
end