module Translinator
  module TextinatorHelper
    def tl(key, options = {})
      text = Text.from_textinator(@tl, key, options) || Text.from_I18n(key, options)
    rescue StandardError => exception
      Text.handle_error(key, options, exception)
    ensure
      return text || Text.default(options)
    end
  end

  module Text
    module_function

    def from_textinator(texts, key, options)
      text = texts.try(:[], key)
      text = (text % options).html_safe if text.present?

      text
    end

    def from_I18n(key, options)
      I18n.t(key, options) if defined?(I18n)
    end

    def default(options)
      options[:default] || ''
    end

    def handle_error(key, options, exception)
      Rails.logger.error "Error on fetching key:#{key} with options:#{options.inspect}:"\
        + " #{exception.message}\n"\
        + exception.backtrace.join("\n")
    end
  end
end
