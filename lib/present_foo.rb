require "delegate"
require "present_foo/version"
require "present_foo/serialization"
require "present_foo/presenter"
require "present_foo/presentation"
require "present_foo/errors"

module PresentFoo

  def self.load!
    hook_rails if defined?(::Rails)
    # TODO: Figure out how to write hook_sinatra and hook_padrino
  end

  private

  def self.hook_rails
    ActiveSupport.on_load(:action_controller) do
      ::ActionController::Base.send :include, Presentation
    end
  end

end

PresentFoo.load!
