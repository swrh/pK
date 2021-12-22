'use strict';

import React from 'react'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'

import Header from './Header'
import Footer from './Footer'

import Home from './pages/Home'
import Users from './pages/users/Index'
import UsersNew from './pages/users/New'
import Departments from './pages/Departments'

export default () => {
    return <div>
        <Router>
            <header>
                <Header />
            </header>
            <main>
                <Routes>
                    <Route path='/' element={<Home />} />
                    <Route path='/users' element={<Users />} />
                    <Route path='/users/new' element={<UsersNew />} />
                    <Route path='/departments' element={<Departments />} />
                </Routes>
            </main>
            <footer>
                <Footer />
            </footer>
        </Router>
    </div>
}
