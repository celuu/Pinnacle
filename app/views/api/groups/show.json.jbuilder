json.group do
  json.extract! @group, :id, :name, :day_of_week, :instructor_name, :image_url, :created_at, :updated_at, :time
end