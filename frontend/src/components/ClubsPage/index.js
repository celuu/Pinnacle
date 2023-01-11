import { GoogleMap, useLoadScript, Marker} from "@react-google-maps/api";
import { useEffect, useMemo } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchClubs, getClubs } from "../../store/club";
import "./ClubsPage.css"
import ListOfClubs from "./ListOfClubs";


const ClubsPage = () => {
    const { isLoaded } = useLoadScript({
      googleMapsApiKey: process.env.GOOGLE_MAPS_API_KEY,
    });

    if (!isLoaded) return <div>Loading...</div>
    return (
      <div className="club-array">
        <ListOfClubs />
        <Map />
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
     
     console.log(clubs)

    return (
      <div className="map-around">
        <GoogleMap
          zoom={12}
          center={center}
          mapContainerClassName="map-container"
        >
          {clubs?.map((club, idx) => 
            <Marker key={idx}
              position={{ lat: +club.latitude, lng: +club.longitude }}
            />
          )}

        </GoogleMap>
      </div>
    );
}

export default ClubsPage;