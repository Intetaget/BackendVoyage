json.journey do
  json.extract! @journey, :id, :title, :description, :region, :user_id
end