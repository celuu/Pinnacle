@reviews.each do |review|
  json.set! review.id do
    json.extract! review, :id, :user_id, :group_id, :summary, :created_at
    json.user review.user
  end
end