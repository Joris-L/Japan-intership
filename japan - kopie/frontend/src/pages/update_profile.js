import React, {Component} from 'react'
// import {
//   BrowserRouter as Router,
//   Switch,
//   Route,
//   Link,
//   Redirect
// } from 'react-router-dom'
import '../css/profile.css'

class UpdateProfile extends Component {

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
      }, 50);
      setTimeout(() => {
        this.getProfile()
      }, 100);
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
            user_id: result.data.id,
          })

        })
      })
    }
  }

  updateProfile(){
    fetch('http://localhost:8080/php/japan/api/update_profile.php',{
      method: 'POST',
      body: JSON.stringify(this.state)
    }).then((respone) => {
      respone.json().then((result) =>{

      })
    })
  }

  getProfile(){
    if(this.state.login){
      fetch('http://localhost:8080/php/japan/api/profile_read.php',{
        method: 'POST',
        body: JSON.stringify(this.state)
      }).then((respone) => {
        respone.json().then((result) =>{
          this.setState({
            profileData: result
          })
          console.log(result)
        })
      })
    }
  }

  render(){
    return( 
      <div>
        {this.state.profileData.map((object, index) => (
          <div key={index} id="profile">
            <div className="jumbotron">
              <p className="credit">Credit: David Edelstein @jlhopes</p>
              <div className="col-3 offset-1 opportunity-col">
                <div className="profilepicture">
                  <img alt="profile" className="profile-image" src={"http://localhost:8080/php/japan/frontend/src/images/" + object.profile_picture}></img>
                </div>
                <input className="form-control" type="file" id="Profilepicture"></input>
                <div className="general">
                  <h5>General information</h5>
                  <strong>Fullname:</strong> <input type="text" className="form-control" id="fullname" defaultValue={object.fullname} onChange={(event) =>{this.setState({fullname:event.target.value})}}></input>
                  <strong>Nationality:</strong> <input type="text" className="form-control" id="nationality" defaultValue={object.nationality} onChange={(event) =>{this.setState({nationality:event.target.value})}}></input>
                  <strong>Living country:</strong> <input type="text" className="form-control" id="living_country" defaultValue={object.living_country} onChange={(event) =>{this.setState({living_country:event.target.value})}}></input>
                  <strong>Already graduated:</strong> <input type="text" className="form-control" id="graduated" defaultValue={object.graduated} onChange={(event) =>{this.setState({graduated:event.target.value})}}></input>
                  <strong>Student:</strong> <input type="text" className="form-control" id="student" defaultValue={object.student} onChange={(event) =>{this.setState({student:event.target.value})}}></input>
                  <strong>Native languages:</strong> <input type="text" className="form-control" id="native_lang" defaultValue={object.native_lang} onChange={(event) =>{this.setState({native_lang:event.target.value})}}></input>
                  <strong>Other fluent languages:</strong> <input type="text" className="form-control" id="fluent_lang" defaultValue={object.fluent_lang} onChange={(event) =>{this.setState({fluent_lang:event.target.value})}}></input>
                </div>
              </div>
            </div>
            <div className="container-fluid">
              <div className="row">
                <div className="col-4 offset-4 ">
                  <h3>About me</h3>
                  <div className="description-profile">
                    <textarea type="text" className="form-control" id="description" defaultValue={object.description} onChange={(event) =>{this.setState({description:event.target.value})}}></textarea>
                    <label>Videolink</label>
                    <div class="input-group mb-3">
                      <span class="input-group-text" id="basic-addon3">https://www.youtube.com/watch?v=</span>
                      <input type="text" className="form-control" id="video_link"
                      defaultValue={object.video_link}
                      onChange={(event) =>{this.setState({video_link:event.target.value})}}></input>
                    </div>
                  </div>
                </div>
                <div className="col-2 offset-1">
                  <div className="skills skills-update">
                    <label>Skills</label>
                    <input type="text" className="form-control" id="tags" defaultValue={object.tags} onChange={(event) =>{this.setState({tags:event.target.value})}}></input>
                    <label>Emailaddress</label>
                    <input type="text" className="form-control" id="email" defaultValue={object.email} onChange={(event) =>{this.setState({email:event.target.value})}}></input>
                  </div>
                  <div className="update">       
                    <button type="button" className="btn btn-primary" onClick={() =>{this.updateProfile()}}>Update profile</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    )
  }
}

export default UpdateProfile;
