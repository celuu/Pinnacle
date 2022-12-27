class Api::GroupsController < ApplicationController

    def index
        @groups = Group.all
        render :index
    end

    def show
        @group = Group.find(params[:id])
        if @group
            render :show
        else
            render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity 
        end
    end

end