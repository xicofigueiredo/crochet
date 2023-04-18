class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def switch_locale(&action)
    locale = session[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
