class Bench < ApplicationRecord
    validates :description, :lat, :lng, presence: true

   def self.in_bounds(bounds)
        benches = []
        self.all.each  do |bench|
            if ((bench.lat < bounds.northEast.lat && bench.lat > bounds.southWest.lat)
                && (bench.lng < bounds.northEast.lng && bench.lng > bounds.southWest.lng))
                
                benches.push(bench)
            end
        end

        benches
   end
end
