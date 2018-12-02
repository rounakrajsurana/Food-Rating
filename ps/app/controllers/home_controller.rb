class HomeController < ApplicationController

    # def user
    #     @users = User.all
    # end

    def index
      @categories = Category.all
      @categories = @categories.paginate(per_page: 8, page: params[:page])

      @stalls = (params[:stall].blank?) ? Stall.all : Stall.where(name: params[:stall])
      @stalls = @stalls.order("updated_at DESC").paginate(per_page: 15, page: params[:page])

      @newdishes = (params[:newdish].blank?) ? Dish.all : Dish.where(name: params[:newdish])
      @newdishes = @newdishes.order("updated_at DESC").paginate(per_page: 15, page: params[:page])

      @dishes = (params[:dish].blank?) ? Dish.all : Dish.where(name: params[:dish])
      @dishes = @dishes.order("created_at DESC").paginate(per_page: 15, page: params[:page])

      @ratings = Rating.all.order("created_at DESC")
      @ratings = @ratings.paginate(per_page: 5, page: params[:page])


      # @category = Category.new
    end

    def member
    end

    def review
      @ratings = Rating.where(user_id: current_user.id).order("updated_at DESC")
      @ratings = @ratings.paginate(per_page: 5, page: params[:page])
    end

    def about
    end

    def map(center)
      "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
    end
end
