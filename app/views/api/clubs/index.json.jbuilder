@clubs.each do |club|
  json.set! club.id do
    json.extract! club, :id, :location, :latitude, :created_at
  end
end