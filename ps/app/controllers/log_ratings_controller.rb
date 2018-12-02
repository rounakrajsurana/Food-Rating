class LogRatingsController < ApplicationController
  # before_action :set_log_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_rating, only: [:new, :create, :edit, :update]
  # GET /log_ratings
  # GET /log_ratings.json
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_user, except: [:new]
  # before_action :find_ratings, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  def index
    @log_ratings = LogRating.all.order(updated_at: :DESC)
  end

  # GET /log_ratings/1
  # GET /log_ratings/1.json
  def show
  end

  # GET /log_ratings/new
  def new
    @log_rating = LogRating.new
  end

  # GET /log_ratings/1/edit
  def edit
  end

  # POST /log_ratings
  # POST /log_ratings.json
  def create
    @log_rating = LogRating.new(log_rating_params)

    respond_to do |format|
      if @log_rating.save
        format.html { redirect_to @log_rating, notice: 'Log rating was successfully created.' }
        format.json { render :show, status: :created, location: @log_rating }
      else
        format.html { render :new }
        format.json { render json: @log_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /log_ratings/1
  # PATCH/PUT /log_ratings/1.json
  def update
    respond_to do |format|
      if @log_rating.update(log_rating_params)
        format.html { redirect_to @log_rating, notice: 'Log rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @log_rating }
      else
        format.html { render :edit }
        format.json { render json: @log_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_ratings/1
  # DELETE /log_ratings/1.json
  def destroy
    @log_rating.destroy
    respond_to do |format|
      format.html { redirect_to log_ratings_url, notice: 'Log rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_rating
      @log_rating = LogRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_rating_params
      params.require(:log_rating).permit(:rating_id, :rate, :comment, :dish_id, :user_id)
    end

    def set_rating
			@dish = Rating.find(params[:rating_id])
		end
end
