class Vote < ApplicationRecord
  belongs_to :dress

  def dress_color
    self.dress.name
  end
end
