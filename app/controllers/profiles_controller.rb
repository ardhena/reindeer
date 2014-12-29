class ProfilesController < ApplicationController
	before_action :authenticate_user!

	expose_decorated(:user)

	def my_profile
    self.user = current_user
	end

  def show
  end

  def edit
    self.user = current_user
  end

  def update
    self.user = current_user
    if user.update(profile_params)
      user.interest_list = params[:user][:interest_list]
      user.save
      redirect_to my_profile_path, notice: 'Your profile info was updated.'
    else
      render 'edit'
    end
  end

  private
    def profile_params
      params.require(:user).permit(:first_name, :last_name, :sex, :birth, :country, :school, :city)
    end

end