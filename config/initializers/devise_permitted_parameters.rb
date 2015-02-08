module DevisePermittedParameters
  extend ActiveSupport::Concern

  include do
    before_filter :configure_permitted_parameters
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name << :email << :avatar
      devise_parameter_sanitizer.for(:sign_in) << :email << :password << :remember_me
      devise_parameter_sanitizer.for(:account_update) << :name << :avatar << :email
    end
end

DeviseController.send :include, DevisePermittedParameters