class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update]
  # before_action :set_stall, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /dishes
  # GET /dishes.json
  load_and_authorize_resource

  def index
    # @dishes = Dish.all
    # @dishes = (params[:q].blank?) ? Dish.all : Dish.where(name: params[:q])
    if params[:q].blank?
        @dishes = Dish.all.order(updated_at: :DESC)
    else
      @q = params[:q];
      @search = "%"+params[:q]+"%";
      @dishes = Dish.where("lower(name) like ?", @search).order(updated_at: :DESC)
    end
    @dishes = @dishes.paginate(per_page: 15, page: params[:page])
    @dish = Dish.new
    # respond_to do |format|
    #   format.html
      # format.json {
      #   render json: Dish.where('name ilike ?', "%#{params[:q]}%")
      #   .select('id, name as dish_name')
      # }
    # end
    # @quotes = @quotes.paginate(per_page: 5, page: params[:page])
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
		if @dish.ratings.blank?
			@average_rating = 0
		else
			@average_rating = @dish.ratings.average(:rate).round(2)
		end
    if current_user
      @myrating = Rating.where("user_id=? and dish_id=?", current_user.id, params[:id]).order(updated_at: :DESC)
	  end
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
    @categories = Category.all

    if current_user.admin?
      @stalls = Stall.all
    elsif current_user.stall?
      @stalls = Stall.where(owner: current_user.id)
    end
  end

  # GET /dishes/1/edit
  def edit
    @categories = Category.all
    if current_user.admin?
      @stalls = Stall.all
    elsif current_user.stall?
      @stalls = Stall.where(owner: current_user.id)
    end
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)
    @dish.user_id = current_user.id
    respond_to do |format|
      if @dish.save
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # def set_stall
    #   @stall = Stall.where(id: params[:stall_id])
    #   # @stall = Stall.find(params[:stall_id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :desc, :picture, :category_id, :stall_id, :user_id)
    end

    # def find_dish
		# 	@dish = Dish.find(params[:dish_id])
		# end
    #
    # def set_downer //set_user
		# 	@user = User.find(params[:user_id])
		# end
end
