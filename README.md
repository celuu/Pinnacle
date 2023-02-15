## README

# Pinnacle

![pinnacle](https://user-images.githubusercontent.com/96757491/212202838-2ec4f52b-d0e9-430f-8182-25b181ed8c8c.gif)

## Overview

[Pinnacle](https://pinnacle-nd0f.onrender.com/) is a clone of the luxury fitness club, [Equinox](https://www.equinox.com/). Users can view fitness classes and are able to learn about what Equinox has to offer.


## Technologies

To build Pinnacle, I used a React-Redux frontend paired with a Ruby on Rails backend, and PostgreSQL as the database management system. For the general styling I used CSS, react-icons for the icons, and a google maps api. 

## Features

Users are able to view classes and filter it based on day of the week and equinox location. Users must be logged in in order to book a class or leave a review on that class. Users can edit or delete the reviews that they left on a class. Admin users have special access where they can add, edit, and delete a class that they would like to add.

## Highlights

The code below demonstrates the use of a Google Maps api. I mapped over data that I received from the backend to create markers. 

```javascript
function Map() {
    const center = useMemo(() => ({ lat: 37.78511512985764, lng:    -122.40753194602581 }));
    const clubs = useSelector(getClubs);
    const dispatch = useDispatch();

     useEffect(() => {
       dispatch(fetchClubs());
     }, [dispatch]);

    return (
      <div className="map-around">
        <GoogleMap
          zoom={12}
          center={center}
          mapContainerClassName="map-container"
        >
          {clubs?.map((club, idx) => (
            <Marker
              className="marker"
              key={idx}
              position={{ lat: +club.latitude, lng: +club.longitude }}
            />
          ))}
        </GoogleMap>
      </div>
    );
}
```

The code below shows how I was able to iterate through days of the week and selecting the current day. It also shows how I was able to fetch the data from the backend and to only grab the data once a user hits a specific day.

```javascript
const weekday = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];

const GroupIndex = () => {
    const dispatch = useDispatch();
    const groups = useSelector(getGroups)
    const [isSelected, setIsSelected] = useState(weekday[(new Date()).getDay()]);
    const [isClicked, setIsClicked] = useState(true);
    const [clubLocation, setClubLocation] = useState(
      "Equinox Sports Club San Francisco"
    );
    const [updateLocation, setUpdateLocation] = useState(false)
    const [openForm, setOpenForm] = useState(false)
    const sessionUser = useSelector((state) => state.session.user);
    const [filterClicked, setFilterClicked] = useState(false)

    useEffect(() => {
        dispatch(fetchGroups(isSelected))
        setUpdateLocation(true)
    }, [dispatch, isSelected, updateLocation])

    const ShowClasses = () => (
      <>
        {isClicked && (
          <ul className="show-class-info">
            {groups?.map((group, idx) =>
              group.dayOfWeek === isSelected && group?.club?.location === clubLocation ? (
                <GroupIndexItem group={group} key={idx} />
              ) : (
                ""
              )
            )}
          </ul>
        )}
      </>
    );

    return (
      <div className="class-container">
        <h1 className="class-title">CLASSES</h1>
        <div className="add-class-container">
          <RenderClubs filterClicked={filterClicked} setClubLocation={setClubLocation} />
          <div className="buttons-container">
            <button
            className="filter-button"
            onClick={(e) => setFilterClicked((prev) => !prev)}
          >
            Filter
          </button>
          {sessionUser && sessionUser.admin && (
            <button
              className="add-class-button"
              onClick={(e) => setOpenForm(true)}
            >
              Add Class
            </button>
          )}
          </div>
        </div>
        <AdminGroupCreate openForm={openForm} setOpenForm={setOpenForm} />
        <div className="weekday-classes">
          {weekday.map((day, idx) => (
            <h2
              key={idx}
              onClick={(e) => {
                setIsSelected(day);
              }}
              className={isSelected === day ? "weekday-selected" : "weekday"}
            >
              {day}
            </h2>
          ))}
        </div>
        <div className="class-wrapper">
          <ShowClasses className="classes-info" />
        </div>
      </div>
    );

}
```
