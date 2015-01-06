class ProfilesController < ApplicationController
	before_action :authenticate_user!

	expose_decorated(:user)
  expose_decorated(:users)

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
      user.interest_list = interests_array
      user.language_list = languages_array
      user.save
      redirect_to my_profile_path, notice: 'Your profile info was updated.'
    else
      render 'edit'
    end
  end

  def index
  end

  private
    def profile_params
      params.require(:user).permit(:first_name, :last_name, :sex, :birth, :country, :school, :city, :bio)
    end

    def interests_array
      (
        params[:user][:new_interests].split(",") + params[:user][:interest_list]
      ).uniq
    end

    def languages_array
      (
        params[:user][:new_languages].split(",") + params[:user][:language_list]
      ).each { |lang| lang.downcase! }.uniq
    end
end