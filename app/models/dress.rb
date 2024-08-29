class Dress < ApplicationRecord
  has_many :votes

  # ドレスに投票された数を返す
  def voted_count
    votes.count
  end

  # このドレスのオッズを計算して返す
  def odds
    total_votes = Vote.count.to_f
    return 0 if voted_count.zero?

    total_votes / voted_count # オッズの計算
  end
end
