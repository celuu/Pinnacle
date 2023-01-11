import "./SingleLocation.css"

const SingleLocation = ({club}) => {
    return (
        <h1 className="single-club">{club.location}</h1>
    )
}

export default SingleLocation;