module Translinator
  module TextinatorCallback
    def translate!(options = {})
      return true unless Translinator::Config.enabled?

      @tl = Textinator.texts(request, options[:search] || {})
      @tl_app_vars = options[:app_vars] || {}
    end
  end
end
