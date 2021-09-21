import React from 'react'; 
import { requestPokemon } from '../../actions/pokemon_actions';


class PokemonDetail extends React.Component {
    constructor(props) {
        super(props); 
    }

    componentDidMount() {
       this.props.requestPokemon(this.props.match.params.pokemonId); 
    }

    // componentDidUpdate(prevProps) {
    //     this.props.requestPokemon(this.props.match.params.pokemonId); 
    // }

    render() {
        return (
            <div>
                {this.props.pokemon.moves}
            </div>
        )
    }
}
    

export default PokemonDetail; 