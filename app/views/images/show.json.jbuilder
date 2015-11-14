json.image do
  json.extract! @image, :id, :photo_file_name, :description, :journey_id
end