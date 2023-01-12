import "./SingleClub.css"

const SingleClub = ({club, setClubLocation}) => {

    const clickHandler = (e) => {
        e.preventDefault();
        setClubLocation(club.location)
    }
    return (
        <p onClick={clickHandler} className="club-locations-class-page">{club.location}</p>
    )
}

export default SingleClub;