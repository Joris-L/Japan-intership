import React, {Component} from 'react'
import {
  // BrowserRouter as Router,
  // Switch,
  // Route,
  // Link,
  Redirect,
} from 'react-router-dom'

class Register extends Component {

  constructor(){
    super();
    this.state={
      email:null,
      password:null,
      register:null,
      login:null,
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
        jwt:store.jwt
      })
    }
  }

  register(){
    fetch('http://localhost:8080/php/japan/api/create_user.php',{
      method: 'POST',
      body: JSON.stringify(this.state)
    }).then((respone) => {
      respone.json().then((result) =>{
        console.warn("result", result)
        if(result.message === 'User was created.'){
          this.setState({'register': true})
        }
      })
    })
  }

  handleKeyPress(e) {
    if (e.key === 'Enter') {
        this.register(); 
    }
  }

  render(){
    return( 
      <div>
        {!this.state.login && !this.state.register?
        <div className="jumbotron">
          <p className="credit">Credit: David Edelstein @jlhopes</p>
          <div className="col-4 offset-4 login-col login-form">
            {this.state.warn ?
              <div class="alert alert-danger" role="alert">
                Login Failed. Wrong email or password.
              </div>
            : ''}
                <h1 className="title">Register</h1>
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
                <button type="button" className="btn btn-link" onClick={() =>{this.register()}}>Register</button>
                </div>
          </div>
        </div>
        : <Redirect to="/home"/> }
      </div>
    )
  }
  
}

export default Register;
