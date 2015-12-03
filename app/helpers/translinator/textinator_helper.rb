module Translinator
  module TextinatorHelper
    include ActionView::Helpers::TagHelper

    def tl(key, options = {}, meta_tag = false)
      text = @tl.try(:[], key)
      if text.blank?
        text ||= I18n.t(key, options) if defined?(I18n)
        text ||= (options[:default] || '')
      else
        text = (text % options).html_safe
      end
      if params.try(:[], :'tl-editable') && !key.include?('seo') && !meta_tag
        return editable_content_tag(text)
      end
      text
    end

    def editable_content_tag(html)
      content_tag(:span, html, class: 'tl-editable')
    end
  end
end
