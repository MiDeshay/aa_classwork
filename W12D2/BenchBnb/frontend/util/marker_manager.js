export default class MarkerManger {
    constructor(map){
        this.map = map;
        this.markers = {}

        this.updateMarkers = this.updateMarkers.bind(this)
    }

    updateMarkers(benches){
        benches.forEach(bench => {
            const latLng = {lat: bench.lat, lng: bench.lng}
            if(!this.markers[bench.id]){
                this.markers[bench.id] = new google.maps.Marker({
                    postion: latLng,
                    map: this.map,
                    title: bench.title
                })
                
            }
        });
    }
}