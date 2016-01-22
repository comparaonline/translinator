module Translinator
  module TextinatorHelper
    def tl(key, options = {})
      options.merge!(@tl_app_vars.call)
      text = Text.from_textinator(@tl, key, options) || Text.from_I18n(key, options)
    rescue StandardError => exception
      Text.handle_error(key, options, exception)
    ensure
      text ||= Text.default(options)
      return text.squish.html_safe
    end
  end

  module Text
    module_function

    def from_textinator(texts, key, options)
      text = texts.try(:[], key)
      text = text % options if text.present?
      text
    end

    def from_I18n(key, options)
      I18n.t(key, options) if defined?(I18n)
    end

    def default(options)
      options[:default] || ''
    end

    def handle_error(key, options, exception)
      Rails.logger.error "Textinator error on fetching key: #{key} with options: #{options.inspect} and params #{params.inspect}"\
        + " #{exception.message}\n"\
        + exception.backtrace.join("\n")
    end
  end
end
