class Api::ClubsController < ApplicationController

    def index
        @clubs = Club.all
        render :index
    end

    def show
        @club = Club.find(params[:id])
        if @club
            render :show
        else
            render json: { errors: @club.errors.full_messages }, status: :unprocessable_entity 
        end
    end

end