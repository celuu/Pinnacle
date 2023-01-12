import { useState } from "react";
import "./RenderClubs.css"
import ShowClubs from "./ShowClubs";



const RenderClubs = ({setClubLocation}) => {
    const [filterClicked, setFilterClicked] = useState(false)

    return (
      <div className="add-class-container"> 
        <button className="filter-button" onClick={(e) => setFilterClicked(prev => !prev)}>Filter</button>
        {filterClicked && <ShowClubs setClubLocation={setClubLocation} />}
      </div>
    );
}

export default RenderClubs;