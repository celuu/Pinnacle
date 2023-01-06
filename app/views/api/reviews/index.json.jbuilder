@reviews.each do |review|
  json.set! review.id do
    json.extract! review, :id, :user_id, :summary, :created_at
  end
end