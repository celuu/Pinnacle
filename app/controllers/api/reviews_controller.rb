class Api::ReviewsController < ApplicationController

    def index
        @groupId = request.query_parameters["group_id"] 
        @reviews = Review.where(group_id: @groupId)
        if @reviews
            render :index
        else 
            render json: {}
        end
    end

    def show
        @review = Review.find(params[:id])
        if @review
            render :show
        else
            render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity 
        end

    end

    def create
        groupId = params[:group_id]
        summary = params[:summary]
        @review = Review.new(user_id: current_user.id, group_id: groupId, summary: summary)
        if @review.save
            render :show
        else
            render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            render :show
        else
            render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.delete()
    end

    private
    
    def review_params
        params.require(:review).permit(:user_id, :group_id, :summary)
    end
end