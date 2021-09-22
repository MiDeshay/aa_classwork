@benches.each do |bench|
    json.extract! bench, :description, :lat, :lng
end