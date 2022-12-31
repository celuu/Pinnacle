import LoginFormPage from "./components/LoginFormPage";
import SignupFormPage from "./components/SignupFormPage";
import React from 'react';
import {Route, Switch} from 'react-router-dom'
import Navigation from "./components/Navigation";
import './App.css'
import ErrorPage from "./components/ErrorPage";
import GroupIndex from "./components/GroupsPage/GroupIndex";
import SingleGroupPage from "./components/SingleGroupPage";


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
          <Route exact path="/groups">
            <GroupIndex />
          </Route>
          <Route path="/groups/:groupId">
            <SingleGroupPage />
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
