json.winner @winner.user_name
json.correct_votes do
  json.array! @correct_votes do |vote|
    json.partial! 'vote', locals: { vote: }
  end
end
