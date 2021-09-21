import React from 'react'; 
import {Link} from "react-router-dom"

export const PokemonIndexItem = (props) => {
    return (
        <li className="pokemon-index-item">
            <Link to={`/pokemon/${props.id}`}>
            <span>{props.id}</span>
            <img src={props.imageUrl}/>
            <span> {props.name} </span>
            </Link>
        </li>
    )
}

  // <li className="pokemon-index-item">
        //   <span>{poke.id}</span>
        //   <img src={poke.imageUrl}/>
        //   <span>{poke.name}</span>
        // </li>