class Api::GroupsController < ApplicationController

    def index
        day_of_week = params[:day_of_week]
        @groups = Group.where(day_of_week: day_of_week)
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

     def create
        @group = Group.new(group_params)
        if @group.save
            render :show
        else
            render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity 
        end 
    end

    def update
        @group = Group.find(params[:id])
        if @group.update(group_params)
            render :show
        else
            render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @group = Group.find(params[:id])
        @group.delete()
    end

    private
    def group_params
        params.require(:group).permit(:name, :day_of_week, :instructor_name, :location, :created_at, :updated_at, :time)
    end

end