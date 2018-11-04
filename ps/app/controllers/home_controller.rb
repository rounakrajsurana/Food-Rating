class HomeController < ApplicationController

    # def user
    #     @users = User.all
    # end

    def index
      @categories = Category.all
      @categories = @categories.paginate(per_page: 8, page: params[:page])

      @stalls = (params[:stall].blank?) ? Stall.all : Stall.where(name: params[:q])
      @stalls = @stalls.paginate(per_page: 16, page: params[:page])

      @dishes = (params[:dish].blank?) ? Dish.all : Dish.where(name: params[:q])
      @dishes = @dishes.paginate(per_page: 16, page: params[:page])

      @ratings = Rating.all
      @ratings = @ratings.paginate(per_page: 5, page: params[:page])

      # @category = Category.new
    end

    def member
    end

    def review
    end

    def about
    end
end
