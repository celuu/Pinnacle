import { useState } from "react";
import "./RenderClubs.css"
import ShowClubs from "./ShowClubs";



const RenderClubs = ({setClubLocation}) => {
    const [filterClicked, setFilterClicked] = useState(false)

    return (
      <>{}
        <button className="filter-button" onClick={(e) => setFilterClicked(true)}>Filter</button>
        {filterClicked && <ShowClubs setClubLocation={setClubLocation}/>}
      </>
    );
}

export default RenderClubs;