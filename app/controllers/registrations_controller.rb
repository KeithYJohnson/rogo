class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for
    # @user = current_user
    # binding.pry
    # render 'home/dashboard' #:locals => :user => @user
    @current_user
  end
end
