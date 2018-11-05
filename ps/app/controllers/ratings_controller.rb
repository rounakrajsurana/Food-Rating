class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :find_dish
  # GET /ratings
  # GET /ratings.json
  load_and_authorize_resource

  def index
    @ratings = Rating.all
    @ratings = @ratings.paginate(per_page: 32, page: params[:page])
    @rating = Rating.new
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
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
    @rating.dish_id = @dish_id
    

      if @rating.save
        redirect_to dish_path(@dish)
        # format.html { redirect_to dish_path, notice: 'Rating was successfully created.' }
        # format.json { render :show, status: :created, location: @rating }
      else
        render 'new'
        # format.html { render :new }
        # format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    
      if @rating.update(rating_params)

        redirect_to dish_path(@dish)
        # format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        # format.json { render :show, status: :ok, location: @rating }
      else

        render 'edit'
        # format.html { render :edit }
        # format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
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

    def find_dish
			@dish = Dish.find(params[:dish_id])
		end
		
		def find_rating
			@rating = Rating.find(params[:id])
		end


end
