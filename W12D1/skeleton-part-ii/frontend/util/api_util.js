export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
}

export const fetchPokemon = (pokeId) => {
  return $.ajax({
    method: 'GET', 
    url: `/api/pokemon/${pokeId}`
  }); 
}