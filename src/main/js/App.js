'use strict';

import React, { useEffect, useState } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'

import { listDepartments, listUsers } from './api/pK';

import Header from './Header'
import Footer from './Footer'

import UserList from './UserList';
import DepartmentList from './DepartmentList';
import HomePage from './HomePage';

export default () => {
    const [departments, setDepartments] = useState(null);
    const [users, setUsers] = useState(null);

    useEffect(() => {
        listDepartments().then((departmentsList) => setDepartments(departmentsList));
        listUsers().then((userList) => setUsers(userList));
    }, []);

    return <div>
        <Router>
            <header>
                <Header />
            </header>
            <main>
                <Routes>
                    <Route path='/' element={<HomePage />} />
                    <Route path='/users' element={<UserList users={users} />} />
                    <Route path='/departments' element={<DepartmentList departments={departments} />} />
                </Routes>
            </main>
            <footer>
                <Footer />
            </footer>
        </Router>
    </div>
}
