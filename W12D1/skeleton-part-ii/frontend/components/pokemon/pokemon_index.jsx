import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';


class PokemonIndex extends React.Component{
  constructor(props){
  super(props)
  }
  
  componentDidMount(){
  this.props.requestAllPokemon()
  }
  
  render(){
    return (
    <section className="pokedex">
      <ul>
      {this.props.pokemon.map((poke) => (
        <PokemonIndexItem 
        id={poke.id} 
        key={poke.id}
        name={poke.name} 
        imageUrl={poke.imageUrl}
        />
        // <li className="pokemon-index-item">
        //   <span>{poke.id}</span>
        //   <img src={poke.imageUrl}/>
        //   <span>{poke.name}</span>
        // </li>
      ))}
      </ul>
    </section>
    )
  }
  }
  
  
  
  export default PokemonIndex;