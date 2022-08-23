class ReservationsController < ApplicationController
  # before_filter :authenticate_user!
  before_action :set_reservation, only: %i[show edit update destroy]
  before_action :set_flat, only: %i[new create]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def show; end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.flat = @flat
    if @reservation.save
      redirect_to flat_path(@reservation.flat)#, flash[:notice] = "Reservation created!"
    else
      render :new
    end
  end

  def edit; end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservations_params) if params[:reservation]
    redirect_to reservation_path
  end

  def destroy
    @reservation.destroy
    redirect_to flat_path(@reservation.flat), status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :number_of_guests, :confirmed, :user_id, :flat_id)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
