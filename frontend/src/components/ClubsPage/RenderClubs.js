import "./RenderClubs.css"
import ShowClubs from "./ShowClubs";



const RenderClubs = ({filterClicked, setClubLocation}) => {

    return (
      <> 
        {filterClicked && <ShowClubs setClubLocation={setClubLocation} />}
      </>
    );
}

export default RenderClubs;