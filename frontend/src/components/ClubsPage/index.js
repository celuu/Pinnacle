import { GoogleMap, useLoadScript, Marker} from "@react-google-maps/api";
import { useEffect, useMemo } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchClubs, getClubs } from "../../store/club";
import "./ClubsPage.css"
import ListOfClubs from "./ListOfClubs";




const ClubsPage = () => {
    const { isLoaded } = useLoadScript({
      googleMapsApiKey: "AIzaSyCvdN-AjB1S6FFb-QwwFRUUlkNoFR1V-7k",
    });

    if (!isLoaded) return <div>Loading...</div>
    return (
      <div className="club-array">
        <div className="list-side">
          <ListOfClubs />
        </div>
        <div className="map-side">
          <Map />
        </div>
      </div>
    );
}



function Map() {
    const center = useMemo(() => ({ lat: 37.78511512985764, lng: -122.40753194602581 }));
    const clubs = useSelector(getClubs);
    const dispatch = useDispatch();

     useEffect(() => {
       dispatch(fetchClubs());
     }, [dispatch]);


    return (
      <div className="map-around">
        <GoogleMap
          zoom={12}
          center={center}
          options={{
            styles: [
              { elementType: "geometry", stylers: [{ color: "#242f3e" }] },
              {
                elementType: "labels.text.stroke",
                stylers: [{ color: "#242f3e" }],
              },
              {
                elementType: "labels.text.fill",
                stylers: [{ color: "#746855" }],
              },
              {
                featureType: "administrative.locality",
                elementType: "labels.text.fill",
                stylers: [{ color: "#d59563" }],
              },
              {
                featureType: "poi",
                elementType: "labels.text.fill",
                stylers: [{ color: "#d59563" }],
              },
              {
                featureType: "poi.park",
                elementType: "geometry",
                stylers: [{ color: "#263c3f" }],
              },
              {
                featureType: "poi.park",
                elementType: "labels.text.fill",
                stylers: [{ color: "#6b9a76" }],
              },
              {
                featureType: "road",
                elementType: "geometry",
                stylers: [{ color: "#38414e" }],
              },
              {
                featureType: "road",
                elementType: "geometry.stroke",
                stylers: [{ color: "#212a37" }],
              },
              {
                featureType: "road",
                elementType: "labels.text.fill",
                stylers: [{ color: "#9ca5b3" }],
              },
              {
                featureType: "road.highway",
                elementType: "geometry",
                stylers: [{ color: "#746855" }],
              },
              {
                featureType: "road.highway",
                elementType: "geometry.stroke",
                stylers: [{ color: "#1f2835" }],
              },
              {
                featureType: "road.highway",
                elementType: "labels.text.fill",
                stylers: [{ color: "#f3d19c" }],
              },
              {
                featureType: "transit",
                elementType: "geometry",
                stylers: [{ color: "#2f3948" }],
              },
              {
                featureType: "transit.station",
                elementType: "labels.text.fill",
                stylers: [{ color: "#d59563" }],
              },
              {
                featureType: "water",
                elementType: "geometry",
                stylers: [{ color: "#17263c" }],
              },
              {
                featureType: "water",
                elementType: "labels.text.fill",
                stylers: [{ color: "#515c6d" }],
              },
              {
                featureType: "water",
                elementType: "labels.text.stroke",
                stylers: [{ color: "#17263c" }],
              },
            ],
          }}
          mapContainerClassName="map-container"
        >
          {clubs?.map((club, idx) => (
            <Marker
              className="marker"
              key={idx}
              position={{ lat: +club.latitude, lng: +club.longitude }}
            />
          ))}
        </GoogleMap>
      </div>
    );
}

export default ClubsPage;