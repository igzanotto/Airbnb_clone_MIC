class ReservationsController < ApplicationController
  before_action :set_user
  before_action :set_reservation, only: %i[show edit update destroy]
  before_action :set_flat, only: %i[new create]

  def index
    # @reservations = policy_scope(reservation)
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def show
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @user
    @reservation.flat = @flat
    @reservation.total_price = ((@reservation.check_out - @reservation.check_in).to_i) * @flat.price
    authorize @reservation
    if @reservation.save
      redirect_to reservations_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @reservation
  end

  def update
    @reservation.update(reservation_params)
    @flat = @reservation.flat
    @reservation.total_price = ((@reservation.check_out - @reservation.check_in).to_i) * @flat.price
    authorize @reservation
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    authorize @reservation
    @reservation.destroy
    redirect_to reservations_path, status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :number_of_guests, :total_price, :confirmed, :user_id, :flat_id)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_user
    @user = current_user
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
