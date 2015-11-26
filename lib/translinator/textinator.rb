module Translinator
  class Textinator
    REQUEST_TIMEOUT = 100

    class << self
      def texts(params)
        path_childen = path_childen_by_priority(params[:url])
        path_childen.inject({}) do |all_texts, path|
          texts_path = get_texts(params.merge(url: path))
          all_texts.merge(texts_path)
        end
      end

      def get_texts(params)
        resource = RestClient::Resource.new(
          CoConfig::TEXTINATOR_API[:text_url],
          timeout: REQUEST_TIMEOUT,
          open_timeout: REQUEST_TIMEOUT
        )
        response = resource.get(params: params)
        texts = JSON.parse(response)
        Hash[texts.map { |t| [t['key'], t['value']] }].with_indifferent_access
      rescue StandardError => e
        {}
      end

      private

      def path_childen_by_priority(path)
        path_children(path).reverse.drop(1)
      end


      def path_children(path)
        path_segments = path_segments(path)
        path_segments.map.with_index do |_, index|
          build_child_path(path_segments, index)
        end
      end

      def build_child_path(path_segments, index)
        delete_segment(path_segments, index).reverse.join('/')
      end

      def path_segments(path)
        path.split('/').reverse
      end

      def delete_segment(path, index)
        path.dup.drop(index)
      end

    end
  end
end
