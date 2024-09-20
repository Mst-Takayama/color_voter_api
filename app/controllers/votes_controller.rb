class VotesController < ApplicationController
  before_action :check_duplicate_vote, only: %i[create new]
  def new
  end

  def result
    token = request.headers['X-User-Token']
    @vote = Vote.find_by(user_token: token)
    render json: { error: '投票が見つかりません' }, status: 404 if @vote.blank?
  end

  def create
    token = request.headers['X-User-Token']
    return render json: { error: 'すでに投票済みです' }, status: :conflict if Vote.find_by(user_token: token).present?

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

    render json: { error: 'すでに投票済みです' }, status: :conflict
  end

  def vote_params
    params.require(:vote).permit(:user_name, :user_token, :dress_id)
  end
end
