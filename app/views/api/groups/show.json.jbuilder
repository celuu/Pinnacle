json.extract! @group, :id, :name, :day_of_week, :instructor_name, :created_at, :updated_at, :time, :location
json.imageUrl @group.photo.url 
