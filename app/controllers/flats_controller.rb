class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  def index
    # if params[:query].present?
    #   @flats = Flat.where("title LIKE ?", "%#{params[:query]}%")
    #   # Preventing SQL Injection and Database error for
    #   # unknown characters
    # else
    # @flats = Flat.all
    # end
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
    # if params[:query].present?
    #   @flats = Flat.where(title: params[:query])
    # else
    #   @flats = Flat.all
    # end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :price, :category, :number_of_guests, :location, :description, :photo, :user_id)
  end
end
