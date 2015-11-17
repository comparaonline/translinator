module Translinator
  module TextinatorCallback
    def translate!(search = {})
      @tl = Textinator.get(
        {
          application: Rails.application.class.parent_name.downcase,
          countryCode: I18n.locale,
          url: request.original_fullpath
        }.merge(search)
      )
    end
  end
end