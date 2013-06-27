# -*- encoding : utf-8 -*-
class ReservationsController < ApplicationController

  def approve
    @reservation = Reservation.find(params[:id])
    
    if Reservation.approve(@reservation)
      flash[:notice] = "Reserva aprovada"
    else
      flash[:error] = "Há conflito de horário nas reservas"
    end

    @reservations = Reservation.all

    redirect_to reservations_url
  end

  def reject
    @reservation = Reservation.find(params[:id])
    
    Reservation.reject(@reservation)

    @reservations = Reservation.all

    redirect_to reservations_url, notice: "Reserva rejeitada"
  end

  def pending
    @reservation = Reservation.find(params[:id])
    
    Reservation.set_pending(@reservation)

    @reservations = Reservation.all

    redirect_to reservations_url, notice: "Estado da reserva passou para 'aguardando'"
  end

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new
    @reservation = Reservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reservation }
    end
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(params[:reservation])
    @reservation.status = "Pending"
    @reservation.user = current_user

    place = Place.find_by_id(params[:reservation][:place_id])

    @reservation.object_resources << place.object_resources if place

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render action: "new" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end
end
