import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions'
import { fetchAllPokemon } from '../util/api_util';


export default pokemonReducer = (state = {}, action) => {
    Object.freeze(state)
    const newState = Object.assign({}, state); 
    switch (action.type) {
        case RECEIVE_ALL_POKEMON: 
            action.pokemon.forEach((pokemon) => {
                newState[entities.pokemon.id] 
            }) 
            // newState[]
    }
}