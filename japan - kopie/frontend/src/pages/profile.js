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

class Profile extends Component {

  constructor(){
    super();
    this.state={
      jwt:null,
      login:null,
      profileData: [],
      user_id:null,
    }
  }

  componentDidMount(){
    this.localStoreCollector()
    setTimeout(() => {
      this.fetchUserData()
    }, 500);
    setTimeout(() => {
      this.getProfile()
    }, 1000);
  } 

  localStoreCollector(){
    let store = JSON.parse(localStorage.getItem('login'))
    if(store && store.login){
      this.setState({
        login:true,
        jwt:store.jwt,
      })
      }
  }

  fetchUserData(){
      fetch('http://localhost:8080/php/japan/api/validate_token.php',{
        method: 'POST',
        body: JSON.stringify(this.state)
      }).then((respone) => {
        respone.json().then((result) =>{
          	console.warn("result", result)
            this.setState({
              user_id: result.data.id,
            })
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
              <div className="general">
                <h5>General information</h5>
                <p><strong>Fullname:</strong> {object.fullname}</p>
                <p><strong>Nationality:</strong> {object.nationality}</p>
                <p><strong>Living country:</strong> {object.living_country}</p>
                <p><strong>Already graduated:</strong> {object.graduated}</p>
                <p><strong>Student:</strong> {object.student}</p>
                <p><strong>Native languages:</strong> {object.native_lang}</p>
                <p><strong>Other fluent languages:</strong> {object.fluent_lang}</p>
              </div>
            </div>
          </div>
          <div className="container-fluid">
            <div className="row">
              <div className="col-4 offset-4 ">
                <h3>About me</h3>
                <div className="description-profile">
                  <p>{object.description}</p>
                  <iframe width="768" height="432" src={"https://www.youtube.com/embed/" + object.video_link } title="YouTube video player" frameBorder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowFullScreen></iframe>
                </div>
              </div>
              <div className="col-2 offset-1">
                <div className="skills">
                  <p className="register-title">Skills</p>
                  <p className="register-info">{object.tags}</p>
                  <a className="register" href={"mailto:" + object.email} >Mail me</a>
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

export default Profile;
