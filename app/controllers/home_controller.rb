class HomeController < ApplicationController

  def index
    render :layout => 'homepage'
  end

  def dashboard
    render :layout => 'application'
  end
end
