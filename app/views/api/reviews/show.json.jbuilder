json.extract! @review, :id, :user_id, :group_id, :summary, :created_at, :updated_at
json.user @review.user