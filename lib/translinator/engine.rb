require 'translinator/textinator'
module Translinator
  class Engine < ::Rails::Engine
    isolate_namespace Translinator
    initializer 'translinator.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        include Translinator::TextinatorCallback
        include Translinator::TextinatorHelper
        helper Translinator::TextinatorHelper
      end
    end
  end
end
