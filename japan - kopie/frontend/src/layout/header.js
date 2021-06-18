import React, {Component} from 'react'
import {
  // BrowserRouter as Router,
  // Switch,
  // Route,
  Link
} from 'react-router-dom'
import '../css/header.css';

class Header extends Component {
  constructor(){
    super();
    this.state={
      jwt:null,
      email:null,
      login:null,
    }
  }

  componentDidMount(){
    let store = JSON.parse(localStorage.getItem('login'))
    if(store && store.login){
      this.setState({
        login:true,
        jwt:store.jwt,
      })
      }
      setTimeout(() => {
        this.fetchUserData()
      }, 200);
    } 

  fetchUserData(){
    if(this.state.login){
      fetch('http://localhost:8080/php/japan/api/validate_token.php',{
        method: 'POST',
        body: JSON.stringify(this.state)
      }).then((respone) => {
        respone.json().then((result) =>{
          if(result.message === 'Access denied.'){
            localStorage.removeItem('login')
          }
          console.warn("result", result)
          this.setState({
            email: result.data.email
          })
        })
      })
    }
  }

  logout(){
    localStorage.removeItem("login")
    this.setState({
      jwt:null,
      email:null,
      login:null,
    })
    window.location.reload()
  }

  render(){
    return( 
    <nav className="navbar navbar-expand-lg navbar-light bg-light">
        <Link className="navbar-brand" to="/">Internship Japan</Link>

        <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav ml-auto">
              {!this.state.login ?
            <li className="nav-item right">
              <Link className="nav-link" to="/login">Login</Link>
            </li>
              : 
            <li className="nav-item dropdown">
              <a className="nav-link dropdown-toggle" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                {this.state.email}
              </a>
              <ul className="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                <li><Link className="dropdown-item" to="/create_profile">Profile</Link></li>
                <li><Link className="dropdown-item" to="/update_profile">Edit Profile</Link></li>
                {/* <li><Link className="dropdown-item" to="/profile">Profile</Link></li> */}
                <li><a onClick={() =>{this.logout()}} className="dropdown-item">Log out</a></li>
              </ul>
            </li>
              }
            </ul>
        </div>
    </nav>
    )
  }
  
}

export default Header;
