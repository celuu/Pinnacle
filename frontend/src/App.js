import LoginFormPage from "./components/LoginFormPage";
import SignupFormPage from "./components/SignupFormPage";
import React from 'react';
import {Route, Switch} from 'react-router-dom'
import Navigation from "./components/Navigation";
import './App.css'
import ErrorPage from "./components/ErrorPage";

function App() {
  return (
    <>
      <div className="background">
        <Navigation />
        <Switch>
          <Route path="/login">
            <LoginFormPage />
          </Route>
          <Route path="/signup">
            <SignupFormPage />
          </Route>
          <Route>
            <ErrorPage />
          </Route>
        </Switch>
      </div>
    </>
  );
}

export default App;
