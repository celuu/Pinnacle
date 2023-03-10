@groups.each do |group|
  json.set! group.id do
    json.extract! group, :id, :name, :day_of_week, :instructor_name, :created_at, :updated_at, :time, :club_id
    json.club group.club
    json.photoUrl group.photo.url 
    # json.imageUrl url_for(group.photo)
  end
end
