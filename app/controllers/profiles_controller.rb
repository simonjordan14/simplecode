class ProfilesController < ApplicationController
    def new
        #from where a user can fill out their own profile.
                            #below array identitifes whos logged in.
        @user = User.find(:params[user_id])
        #prepare form for profile
        @profile = @user.build_profile
    end
end