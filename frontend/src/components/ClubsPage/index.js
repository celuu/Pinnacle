import { GoogleMap, useLoadScript, Marker} from "@react-google-maps/api";
import { useMemo } from "react";
import "./ClubsPage.css"

const ClubsPage = () => {
    const { isLoaded } = useLoadScript({
      googleMapsApiKey: process.env.GOOGLE_MAPS_API_KEY ,
    });

    if (!isLoaded) return <div>Loading...</div>
    return (
      <>
        <Map />
      </>
    );
}

function Map() {
    const center = useMemo(() => ({ lat: 37.78511512985764, lng: -122.40753194602581 }));
    return (
      <div className="map-around">
        <GoogleMap
          zoom={12}
          center={center}
          mapContainerClassName="map-container"
        >
          <Marker
            position={{ lat: 37.786810475008565, lng: -122.404356173598931 }}
          />
        </GoogleMap>
      </div>
    );
}

export default ClubsPage;