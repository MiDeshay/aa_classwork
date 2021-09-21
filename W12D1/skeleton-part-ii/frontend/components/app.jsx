import {Route, Switch} from "react-router-dom";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import PokemonDetailContainer from "./pokemon/pokemon_detail_container"
import React from 'react';

const App = () =>  (
    <Switch>
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer}/>
        <Route path="/" component={PokemonIndexContainer}/>
    </Switch>
    
)

export default App