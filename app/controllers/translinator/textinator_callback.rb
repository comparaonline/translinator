module Translinator
  module TextinatorCallback
    def translate!(search = {})
      @tl = Textinator.texts({
        application: Rails.application.class.parent_name.downcase,
        countryCode: defined?(I18n) ? I18n.locale : :cl,
        url: request.original_fullpath
      }.merge(search))
    end
  end
end
