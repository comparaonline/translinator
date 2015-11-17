module Translinator
  module TextinatorHelper
    def tl(key, default = '')
      @tl.try(:[], key) || default
    end
  end
end
