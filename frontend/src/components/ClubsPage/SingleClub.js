import "./SingleClub.css"

const SingleClub = ({club, setClubLocation}) => {

    const clickHandler = (e) => {
        e.preventDefault();
        setClubLocation(club.location)
    }
    return (
        <h1 onClick={clickHandler} className="club-locations-class-page">{club.location}</h1>
    )
}

export default SingleClub;