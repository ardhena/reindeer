class ProfilesController < ApplicationController
	before_action :authenticate_user!

	expose_decorated(:user)
  expose_decorated(:users)
  expose(:profile_search) { ProfileSearch.new(params[:profile_search]) }
  expose_decorated(:friends, decorator: UserDecorator, collection: true) { user.accepted_friends }

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
    self.users = profile_search.results.where.not(id: current_user.id)
    if params[:profile_search].present?
      friends = params[:profile_search][:friends]
      unless friends.to_bool
        self.users -= current_user.accepted_friends
      end
    else
      self.users -= current_user.accepted_friends
    end
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