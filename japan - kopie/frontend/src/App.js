import React, {Component} from 'react'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  // Link
} from 'react-router-dom'

import Register from './pages/register'
import Profile from './pages/profile'
import Login from './pages/login'
import Home from './pages/home'
import Header from './layout/header'
import CreateProfile from './pages/create_profile'
import UpdateProfile from './pages/update_profile'
import Profile_Others from './pages/profile_others'
class App extends Component {
  render(){
    return( 
      <div>
        <Router>
          <Header/>
          <div>
            <Switch>
              <Route path="/profile">
                <Profile/>
              </Route>
              <Route path="/create_profile">
                <CreateProfile/>
              </Route>
              <Route path="/update_profile">
                <UpdateProfile/>
              </Route>
              <Route path="/profile_others/:id" component={Profile_Others} exact />
              <Route path="/register">
                <Register/>
              </Route>
              <Route path="/login">
                <Login/>
              </Route>
              <Route path="/">
                <Home/>
              </Route>
            </Switch>
          </div>
        </Router>
      </div>
    )
  }
  
}

export default App;
