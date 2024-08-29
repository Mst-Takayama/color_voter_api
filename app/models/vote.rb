class Vote < ApplicationRecord
  belongs_to :dress

  def dress_color
    dress.name
  end
end
