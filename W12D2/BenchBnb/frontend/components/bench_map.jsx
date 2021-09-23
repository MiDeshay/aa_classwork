import React from "react";
import MarkerManger from "../util/marker_manager";

class BenchMap extends React.Component {

    componentDidMount() {
        const mapOptions = {
            center: {lat: 47.563251, lng: -122.021851},
            zoom: 13
        }

        this.map= new google.maps.Map(this.mapNode, mapOptions)
        this.MarkerManger = new MarkerManger(this.map)
    }

    componentDidUpdate(){
        this.MarkerManger.updateMarkers(this.props.benches)
    }

    render(){
        return (
            <div id="map-container" ref={map => this.mapNode = map}>

            </div>
        )
    }
}

export default BenchMap;