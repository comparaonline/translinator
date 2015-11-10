module Translinator
  module TextinatorCallback
    def translate!(search = {})
      @tl = Textinator.get(
        {
          application: Rails.application.class.parent_name.downcase,
          countryCode: :br,
          url: request.original_fullpath
        }.merge(search)
      )
    end
  end
end