json.journey do
  json.id @journey.id
  json.title @journey.title
  json.description @journey.description
  json.region @journey.region
  json.user_id @journey.user_id
  json.photo_url @journey.photo.url
end