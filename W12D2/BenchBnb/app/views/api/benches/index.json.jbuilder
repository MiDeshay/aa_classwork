json.array! @benches do |bench|
    json.extract! bench, :description, :lat, :lng
end