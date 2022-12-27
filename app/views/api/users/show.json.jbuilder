json.user do
  json.extract! @user, :id, :fname, :lname, :email, :username, :created_at, :updated_at
end