class HomeController < ApplicationController
    def user
        @users = User.all
    end
end
