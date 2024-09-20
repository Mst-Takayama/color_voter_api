json.id @vote.id
json.voted_dress @vote.dress_color
json.voted_count @vote.dress.voted_count
json.odds @vote.dress.odds
json.dresses do
  json.array! Dress.all do |dress|
    json.partial! 'dress', locals: { dress: }
  end
end
