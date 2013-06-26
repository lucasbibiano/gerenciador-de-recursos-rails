class HomeController < ApplicationController
  before_filter :already_logged
  layout 'not_logged'

  def index
  end

  def about
  end

  private

  def already_logged
    redirect_to dashboard_path if current_user
  end
end
