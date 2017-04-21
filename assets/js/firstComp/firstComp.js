import React, { Component} from 'react'
import ReactDOM from 'react-dom'

class Layout extends Component{
  constructor () {
    super()
    this.name = "Joe"
  }
    render () {
      return (
        <h1>Hello world {this.name}</h1>
      );
    }
  }



const app = document.getElementById('app')

ReactDOM.render(<Layout />, app)
