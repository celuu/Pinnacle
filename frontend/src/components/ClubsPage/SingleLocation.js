import "./SingleLocation.css"

const SingleLocation = ({club}) => {
    return (
      <>
        <h1 className="single-club">{club.location}</h1>
        <p className="single-club">{club.address}</p>
        <p className="single-club">{club.phoneNum}</p>
      </>
    );
}

export default SingleLocation;