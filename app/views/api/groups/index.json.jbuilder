@groups.each do |group|
  json.set! group.id do
    json.extract! group, :id, :name, :day_of_week, :instructor_name, :image_url, :created_at, :updated_at, :time, :location
  end
end
