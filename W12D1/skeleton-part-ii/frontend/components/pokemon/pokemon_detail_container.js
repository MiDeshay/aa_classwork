import {connect} from 'react-redux'; 
import { requestPokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const mSTP = (state, ownProps) => ({
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId]
})

const mDTP = (dispatch) => ({
    requestPokemon: (pokeId) => dispatch(requestPokemon(pokeId))
})

export default connect(mSTP, mDTP)(PokemonDetail)