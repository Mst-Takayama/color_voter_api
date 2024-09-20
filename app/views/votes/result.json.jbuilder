json.id @vote.id
json.voted_dress @vote.dress_color
json.dresses do
  json.array! Dress.all do |dress|
    json.partial! 'dress', locals: { dress: }
  end
end
