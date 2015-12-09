module Translinator
  module TextinatorHelper
    include ActionView::Helpers::TagHelper

    def tl(key, options = {})
      text = @tl.try(:[], key)
      text ||= fallback(key, options)
      Rails.logger.debug('='*50)
      Rails.logger.debug(editable?)
      Rails.logger.debug('='*50)
      return editable_content_tag(text) if editable? && !meta_tag?(key)
      text
    end

    def editable_content_tag(html)
      content_tag(:span, html, class: 'tl-editable')
    end

    def fallback(key, options)
      text = tl_translate(key, options)
      text ||= tl_default(key, options)
    end

    def tl_translate(key, options)
      I18n.t(key, options) if defined?(I18n)
    end

    def tl_default(key, options)
      options[:default] || ''
    end

    def editable?
      params.try(:[], :'tl-editable')
    end

    def meta_tag?(key)
      key.include?('seo')
    end
  end
end
