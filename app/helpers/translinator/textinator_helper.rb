module Translinator
  module TextinatorHelper
    def tl(key, default)
      @tl[key].present? ? @tl[key] : default
    end
  end
end
