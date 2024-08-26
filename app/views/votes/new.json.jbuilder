json.array! Dress.all.each do |dress|
  json.partial! 'dress', locals: { dress: }
end
