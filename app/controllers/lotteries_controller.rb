class LotteriesController < ApplicationController
  def index
    # 正解のドレスを選んだユーザーをすべて取得する
    @correct_votes = Vote.where(dress_id: 2)
    # ランダムに1人選んで当選者とする
    @winner = @correct_votes.sample
    render json: { error: '当選者がいません' }, status: 404 if @winner.blank? || @correct_votes.blank?
  end
end
