class Api::ReservationsController < ApplicationController

    def index
        @groupId = request.query_parameters["group_id"] 
        @reservation = Reservation.where(user_id: current_user.id).where(group_id: @groupId).last
        if @reservation
            render :show
        else
            render json: {}
        end
    end

    def show
        @reservation = Reservation.find(params[:id])
        if @reservation
            render :show
        else
            render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity 
        end
    end

    def create
        groupId = params[:group_id]
        @reservation = Reservation.new(user_id: current_user.id, group_id: groupId)
        if @reservation.save
            render :show
        else
            render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity 
        end 
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.delete()
    end

    private
    def reservation_params
        params.require(:reservation).permit(:user_id, :group_id)
    end

end