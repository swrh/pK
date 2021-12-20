'use strict';

import { useEffect, useState } from 'react';

import { listDepartments, listUsers } from './api/pK';

import UserList from './UserList';
import DepartmentList from './DepartmentList';

const React = require('react');

export default () => {
    const [departments, setDepartments] = useState(null);
    const [users, setUsers] = useState(null);

    useEffect(() => {
        listDepartments().then((departmentsList) => setDepartments(departmentsList));
        listUsers().then((userList) => setUsers(userList));
    }, []);

    return <div>
        <h1>pK</h1>
        <UserList users={users} />
        <DepartmentList departments={departments} />
    </div>;
}
