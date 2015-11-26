module Translinator
  module TextinatorHelper
    def tl(key, options = {})
      text = @tl.try(:[], key)
      if text.blank?
        return I18n.t(key, options) if defined?(I18n)
        return options.try(:[], :default) || ''
      end
      (text % options).html_safe
    end
  end
end
