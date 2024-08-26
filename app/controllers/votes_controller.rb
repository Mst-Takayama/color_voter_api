class VotesController < ApplicationController
  def new
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      render json: { id: @vote.id, voted_dress: @vote.dress_color }, status: 201
    else
      render json: { errors: @vote.errors.full_messages }, status: 422
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:user_name, :user_token, :dress_id)
  end
end
