import "./LandingPage.css"

const LandingPage = () => {
    return (
      <>
        <div className="hero-container">
          <video width="100%" height="100%" loop autoPlay muted>
            <source src="jumping_video.mp4" alt="jumprope" type="video/mp4" />
          </video>
        </div>
        <div className="greeting">
          <h1 className="hero-big">JANUARY WANTS TO FIND A SHORTCUT.</h1>
          <p className="hero-little">WE DON'T SPEAK JANUARY.</p>
        </div>

        <div className="second-greeting">
          <h1 className="second-big">MEMBERSHIP WITH BENEFITS</h1>
          <p className="second-little">
            Unrivaled Group Fitness classes. Unparalleled Personal Training.
            Studios that inspire you to perform and luxury amenities that keep
            you feeling your best.
          </p>
        </div>
        <img src="gym.jpg" width="100%" height="100%" />

        <div className="third-greeting">
          <h1 className="third-big">WHERE LUXURY AND FITNESS MEET</h1>
          <p className="third-little">
            Clubs that deliver an unrivaled experience to maximize your
            potential, and luxury amenities that keep you performing at your
            best.
          </p>
        </div>
        <img src="equinoxny.jpg" width="100%" height="90%" />
        <div className="three-divs">
          <div className="single-div">
            <h1 className="third-big">UNLIMITED CLASSES</h1>
            <p className="third-little">
              Classes curated and developed by the industry's best talent,
              bringing results through innovation.
            </p>
          </div>
          <div className="single-div">
            <h1 className="third-big">PERSONAL TRAINING</h1>
            <p className="third-little">
              Performance at its highest level with reowned Personal Training.
            </p>
          </div>
          <div className="single-div">
            <h1 className="third-big">STUDIO PILATES</h1>
            <p className="third-little">
              A purely authentic Pilates experience that strengthens and creates
              balance in the body.
            </p>
          </div>
        </div>
        <div className="side-by-side-container">
          <div className="side-by-side squat">
            <img src="squat.jpg" />
          </div>
          <div className="side-by-side vid">
            <img src="eqx-vids.webp" />
          </div>
        </div>
      </>
    );
}

export default LandingPage;