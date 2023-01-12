import "./SingleLocation.css"

const SingleLocation = ({club}) => {
    return (
      <div className="single-club-container">
        <h1 className="single-club single-club-location">{club.location}</h1>
        <p className="single-club">{club.address}</p>
        <p className="single-club single-club-line">{club.phoneNum}</p>
      </div>
    );
}

export default SingleLocation;