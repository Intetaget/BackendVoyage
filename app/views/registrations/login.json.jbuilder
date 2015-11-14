json.user do
  json.extract! @user, :full_name, :email, :access_token
end