import React, {Component} from 'react'
import {
  // BrowserRouter as Router,
  // Switch,
  // Route,
  // Link,
  Redirect
} from 'react-router-dom'
import '../css/login.css'

class Login extends Component {

  constructor(){
    super();
    this.state={
      email:null,
      password:null,
      login:null,
      jwt:null,
      warn:null
    }
  }

  componentDidMount(){
    this.storeCollector()
  }

  storeCollector(){
    let store = JSON.parse(localStorage.getItem('login'))
    if(store && store.login){
      this.setState({
        login:true,
        jwt:store.jwt,
      })
    }
  }

  login(){
    fetch('http://localhost:8080/php/japan/api/login.php',{
      method: 'POST',
      body: JSON.stringify(this.state)
    }).then((respone) => {
      respone.json().then((result) =>{
        if(result.message === "Login failed."){
          this.setState({
            warn:true
          })
        } else {
          localStorage.setItem('login', JSON.stringify({
            login:true,
            jwt:result.jwt,
          }))
        }
        this.storeCollector()
      })
    })
    setTimeout(() => {
      window.location.reload();
    }, 400);
  }

  handleKeyPress(e) {
    if (e.key === 'Enter') {
        this.login(); 
    }
  }

  render(){
    return( 
      <div>
        {!this.state.login?
        <div className="jumbotron">
          <p className="credit">Credit: David Edelstein @jlhopes</p>
          <div className="col-4 offset-4 login-col login-form">
            {this.state.warn ?
              <div class="alert alert-danger" role="alert">
                Login Failed. Wrong email or password.
              </div>
            : ''}
                <h1 className="title">Login</h1>
                <div className="mb-3" auto>
                  <label>Email address</label>
                  <input type="email" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({email:event.target.value})}}></input>
                </div>
                <div className="mb-3">
                  <label>Password</label>
                  <input type="password" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({password:event.target.value})}} onKeyUp={this.handleKeyPress.bind(this)}></input>
                </div>  
                <div className="login">       
                <button type="button" className="btn btn-link" onClick={() =>{this.login()}}>Login</button>
                </div>
          </div>
        </div>
        : <Redirect to="/home"/> }
      </div>
    )
  }
}

export default Login;
