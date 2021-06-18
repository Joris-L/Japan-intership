import React, {Component} from 'react'
import {
  // BrowserRouter as Router,
  // Switch,
  // Route,
  Link
} from 'react-router-dom'
import '../css/home.css';

class Home extends Component {

  constructor(){
    super();
    this.state={
      search:null,
      data: []
    }
  }

  search(){
    fetch('http://localhost:8080/php/japan/api/search.php',{
      method: 'POST',
      body: JSON.stringify(this.state)
    }).then((respone)=>{
      respone.json().then((result)=>{
        this.setState({
          data: result
        })
      })
    })
  }

  handleKeyPress(e) {
    if (e.key === 'Enter') {
      this.search(); 
    }
  }

  render(){
    return( 
      <div>
        <div className="jumbotron">
          <p className="credit">Credit: David Edelstein @jlhopes</p>
          <div className="col-5 opportunity-col">
                <div className="opportunity">
                  <p>Most recent opportunity's</p>
                </div>
                <div className="companys">
                <section className="search-result-item">
                <img alt='companylogo' className="image image-link" src="http://localhost:8080/php/japan/frontend/src/images/japan.png"/>
                <div className="search-result-item-body">
                    <div className="row">
                        <div className="col-sm-9">
                            <h4 className="search-result-item-heading">Company name</h4>
                            <p className="info">info</p>
                            <p className="description-home">Company description</p>
                            <p className="description-home">Company tags</p>
                        </div>
                        <div className="col-sm-3 text-align-center">
                          <Link className="btn btn-primary btn-info btn-sm" to="/">More information</Link>
                        </div>
                    </div>
                </div>
              </section>
                </div>
          </div>
        </div>
        <div className="container-fluid">
          <div className="row">
            {/* <div className="col-5">
                <div className="opportunity">
                  <p>Most recent opportunity's</p>
                </div>
                <div className="companys">
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>
                </div>
            </div> */}
            <div className="col-5 offset-4">
              <div className="input-group mb-3">
                <input type="text" className="form-control search-input" placeholder="search..."
                onChange={(event) =>{this.setState({search:event.target.value})}}
                onKeyUp={this.handleKeyPress.bind(this)}></input>
                <div className="input-group-append">
                  <button className="btn btn-outline-secondary search-button" type="button"
                  onClick={() =>{this.search()}}><i className="bi bi-search"></i></button>
                </div>
              </div>
                
              { this.state.data?
              this.state.data.map((object, index) => (
              <section key={index} className="search-result-item">
                <img alt={object.profile_picture} className="image image-link" src={"http://localhost:8080/php/japan/frontend/src/images/" + object.profile_picture}/>
                <div className="search-result-item-body">
                    <div className="row">
                        <div className="col-sm-9">
                            <h4 className="search-result-item-heading">{object.fullname}</h4>
                            <p className="info">info</p>
                            <p className="description-home">{object.description}</p>
                            <p className="description-home">{object.tags}</p>
                        </div>
                        <div className="col-sm-3 text-align-center">
                          <Link className="btn btn-primary btn-info btn-sm" to={{pathname: `/profile_others/${object.user_id}`}}>More information</Link>
                        </div>
                    </div>
                </div>
              </section>
              )): <p>no profiles matched your search term...</p>}
            </div>
            <div className="col-2 offset-1">
              <div className="register-cols">
                <p className="register-title">For companies</p>
                <p className="register-info">Create your proflie here</p>
                <Link className="register" to="/register">Register</Link>
              </div>
              <div className="register-cols">
                <p className="register-title">New intern?</p>
                <p className="register-info">Create your proflie here</p>
                <Link className="register" to="/register">Register</Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
  
}

export default Home;
