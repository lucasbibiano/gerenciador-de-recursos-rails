# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource
  
  protected

  def layout_by_resource
    if user_signed_in?
      'application'
    elsif params[:controller] == 'home'
      'not_logged'
    elsif devise_controller?
      'devise_layout'
    end
  end
end
