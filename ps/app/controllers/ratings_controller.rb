class RatingsController < ApplicationController
  # before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_dish, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_user, except: [:new]
  # before_action :find_ratings, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  # GET /ratings
  # GET /ratings.json

  def index
    @ratings = Rating.all.order(updated_at: :DESC)
    @ratings = @ratings.paginate(per_page: 32, page: params[:page])
    @rating = Rating.new
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @log_ratings = LogRating.where("rating_id=?",params[:id]).order(updated_at: :DESC)
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit

  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    @rating.dish_id = @dish.id
    respond_to do |format|
      if @rating.save
        #============== Insert LogRating (Initial) ================
        conn = ActiveRecord::Base.connection
        rid = conn.quote(@rating.id) #sanitized params[:id]
        query = "INSERT INTO log_ratings(rating_id, rate, comment, created_at, updated_at, dish_id, user_id)
        select id, rate, comment, updated_at, updated_at, dish_id, #{current_user.id} from ratings where id=#{rid}"
        result = conn.execute(query)

        # redirect_to dish_path(@dish)
        format.html { redirect_to dish_path(@dish), notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else

        render 'new'
        # format.html { render :new }
        # format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        #============== Insert LogRating (Updates)================
        conn = ActiveRecord::Base.connection
        rid = conn.quote(@rating.id) #sanitized params[:id]
        query = "INSERT INTO log_ratings(rating_id, rate, comment, created_at, updated_at, dish_id, user_id)
        select id, rate, comment, updated_at, updated_at, dish_id, #{current_user.id} from ratings where id=#{rid}"
        result = conn.execute(query)
        # log_rating_params=rating_params
        # log_rating_params[:rating_id] = @rating.id
        # @log_rating = LogRating.new(log_rating_params)
        # result=@log_rating.save

        # redirect_to dish_path(@dish)
        # format.html { redirect_to dish_path(@dish), notice: log_rating_params[:created_at]}
        format.html { redirect_to dish_path(@dish), notice: 'Rating was successfully updated.'}
        format.json { render :show, status: :ok, location: @rating }
      else
        # render 'edit'
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    did = @rating.dish_id
    @rating.destroy

    respond_to do |format|
       format.html { redirect_to dish_path(did), notice: 'Rating was successfully destroyed.' }
    #   format.json { head :no_content }
    end
  end

  def execute_statement(sql)
      results = ActiveRecord::Base.connection.execute(sql)
      if results.present?
        return results
      else
        return nil
      end

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:rate, :comment)
    end

    def set_dish
			@dish = Dish.find(params[:dish_id])
		end

		# def find_ratings
		# 	@ratings = Rating.find(params[:id])
		# end

    # def set_user
		# 	@user = User.find(params[:user_id])
		# end
end
