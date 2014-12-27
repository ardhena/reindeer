class ProfilesController < ApplicationController
	before_action :authenticate_user!

	expose_decorated(:user)

	def my_profile
    self.user = current_user
	end

end