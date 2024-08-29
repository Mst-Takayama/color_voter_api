class VotesController < ApplicationController
  before_action :check_duplicate_vote, only: %i[create new]
  def new
  end

  def result
    token = request.headers['X-User-Token']
    @vote = Vote.find_by(user_token: token)
    if @vote.present?
      render json: { id: @vote.id, voted_dress: @vote.dress_color, voted_count: @vote.dress.voted_count, odds: @vote.dress.odds },
             status: 200
    else
      render json: { error: 'No vote found' }, status: 404
    end
  end

  def create
    token = request.headers['X-User-Token']
    if Vote.find_by(user_token: token).present?
      return render json: { error: 'You have already voted' }, status: :conflict
    end

    @vote = Vote.new(vote_params)
    if @vote.save
      render json: { id: @vote.id, voted_dress: @vote.dress_color }, status: 201
    else
      render json: { errors: @vote.errors.full_messages }, status: 422
    end
  end

  private

  def check_duplicate_vote
    token = request.headers['X-User-Token']
    vote = Vote.find_by(user_token: token)
    return unless vote.present?

    render json: { error: 'You have already voted' }, status: :conflict
  end

  def vote_params
    params.require(:vote).permit(:user_name, :user_token, :dress_id)
  end
end
