module Translinator
  module TextinatorHelper
    def tl(key, options = {})
      text = @tl.try(:[], key)
      return (text % options).html_safe if text
      I18n.t(key, options)
    end
  end
end
