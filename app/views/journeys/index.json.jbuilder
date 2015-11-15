json.journeys @journeys do |journey|
  json.extract! journey, :id, :title, :description, :region, :user_id
end