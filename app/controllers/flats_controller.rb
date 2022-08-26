class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  FLATS_PER_PAGE = 3

  def index
    # if params[:query].present?
    #   @flats = Flat.where("title LIKE ?", "%#{params[:query]}%")
    #   # Preventing SQL Injection and Database error for
    #   # unknown characters
    # else
    # @flats = Flat.all
    # end
    @flats = policy_scope(Flat)
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
      @page =  params[:page].to_i
    else
      # @flats = Flat.all
      @page =  params[:page].to_i
      @flats = Flat.offset(@page * FLATS_PER_PAGE).limit(FLATS_PER_PAGE)
    end
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end
    authorize @flat
  end


  def show
    @reservation = Reservation.new
    @flat = Flat.find(params[:id])
    @markers = [{
        lat: @flat.geocode[0],
        lng: @flat.geocode[1],
        info_window: render_to_string(partial: "info_window", locals: {flat: @flat})
      }]
    authorize @flat
  end


  def edit
    authorize @flat
  end

  def update
    authorize @flat
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @flat
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  def this_flat_reservations
    @reservations = Reservation.where("flat_id:#{params[:flat_id]}")
  end

  # def blank_stars
  #   5 - ratings.to_i
  # end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :price, :category, :number_of_guests, :location, :description, :photo, :user_id)
  end
end
