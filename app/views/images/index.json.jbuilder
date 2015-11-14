json.images @images do |image|
  json.id image.id
  json.file_name image.photo_file_name
  json.description image.description
  json.journey_id image.journey_id
  json.url image.photo.url
end