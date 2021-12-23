'use strict';

import React from 'react'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'

import Header from './Header'
import Footer from './Footer'

import Home from './pages/Home'
import Users from './pages/users/Index'
import UsersNew from './pages/users/New'
import UsersEdit from './pages/users/Edit'
import Departments from './pages/departments/Index'
import DepartmentsNew from './pages/departments/New'
import DepartmentsEdit from './pages/departments/Edit'

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
                    <Route path='/users/:id' element={<UsersEdit />} />
                    <Route path='/departments' element={<Departments />} />
                    <Route path='/departments/new' element={<DepartmentsNew />} />
                    <Route path='/departments/:id' element={<DepartmentsEdit />} />
                </Routes>
            </main>
            <footer>
                <Footer />
            </footer>
        </Router>
    </div>
}
