class ApplicationController < ActionController::API
  before_action :check_duplicate_vote

  def check_duplicate_vote
    token = request.headers['X-User-Token']
    vote = Vote.find_by(user_token: token)
    return unless vote.present?

    render json: { id: vote.id, voted_dress: vote.dress_color }, status: 200
  end
end
