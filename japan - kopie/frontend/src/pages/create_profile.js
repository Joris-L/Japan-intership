import React, {Component} from 'react'
// import {
//   BrowserRouter as Router,
//   Switch,
//   Route,
//   Link,
//   Redirect
// } from 'react-router-dom'
import '../css/profile.css'
import '../css/login.css'
import { withRouter } from 'react-router';

class CreateProfile extends Component {

  constructor(){
    super();
    this.state={
      jwt:null,
      login:null,
      profileData: [],
      user_id:null,
      fullname: null,
      email: null,
      description: null,
      profile_picture: null,
      video_link: null,
      tags: null,
      nationality: null,
      living_country: null,
      graduated: null,
      student: null,
      native_lang: null,
      fluent_lang: null,
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
      }, 1);

  } 
  
    fetchUserData(){
    if(this.state.login){
      fetch('http://localhost:8080/php/japan/api/validate_token.php',{
        method: 'POST',
        body: JSON.stringify(this.state)
      }).then((respone) => {
        respone.json().then((result) =>{
          console.warn("result", result)
          this.setState({
            user_id: result.data.id,
          })
          this.checkProfileExist()
        })
      })
    }
  }

  createProfile(){
    fetch('http://localhost:8080/php/japan/api/create_intern.php',{
      method: 'POST',
      body: JSON.stringify(this.state)
    }).then((respone) => {
      respone.json().then((result) =>{
        this.props.history.push('/profile')
      })
    })
  }

  checkProfileExist(){
    if(this.state.login){
      fetch('http://localhost:8080/php/japan/api/profile_read.php',{
        method: 'POST',
        body: JSON.stringify(this.state)
      }).then((respone) => {
        respone.json().then((result) =>{
          if(result.message === 'Failed to get profile.'){
            return
          } else {
          this.props.history.push('/profile')
          }
          console.log(result)
        })
      })
    }
  }

  render(){
    return( 
      <div>
        <div className="jumbotron">
          <p className="credit">Credit: David Edelstein @jlhopes</p>
          <div className="col-4 offset-4 login-col login-form">
                <h1 className="title">Create profile</h1>
                <div className="mb-3" auto>
                  <label>Fullname</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({fullname:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Emailaddress</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({email:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Description</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({description:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Profile picture</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({profile_picture:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Videolink</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({video_link:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Tags</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({tags:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Nationality</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({nationality:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Living country</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({living_country:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Graduated</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({graduated:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Student</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({student:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Native languages</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({native_lang:event.target.value})}}></input>
                </div>
                <div className="mb-3" auto>
                  <label>Fluent languages</label>
                  <input type="text" className="form-control" id="exampleFormControlInput1"
                  onChange={(event) =>{this.setState({fluent_lang:event.target.value})}}></input>
                </div>
                <div className="login">       
                <button type="button" className="btn btn-link" onClick={() =>{this.createProfile()}}>Create profile</button>
                </div>
            </div>
          </div>
      </div>
    )
  }
  
}

export default withRouter(CreateProfile);
