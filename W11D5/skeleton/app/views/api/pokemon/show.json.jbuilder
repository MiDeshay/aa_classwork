json.set! "pokemon" do 
    json.set! @pokemon.id do
        json.id @pokemon.id
        json.name @pokemon.name
        json.attack @pokemon.attack
        json.defense @pokemon.defense
        json.poke_type @pokemon.poke_type
        json.image_url @pokemon.image_url

    end
end

json.set! "moves" do 
    @pokemon.moves.each do |move|
        json.set! move.id do 
            json.id move.id
            json.name move.name
        end 
    end 
end

json.set! "items" do 
    @pokemon.items.each do |item|
        json.set! item.id do 
            json.id item.id 
            json.pokemon_id item.pokemon_id
            json.name item.name 
            json.price item.price 
            json.happiness item.happiness
            json.image_url item.image_url 
        end 
    end 
end 