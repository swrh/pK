'use strict';

import { useEffect, useState } from 'react';

import { listUsers } from './api/pK';

import { UserList } from './UserList';

const React = require('react');

const App = () => {
    const [users, setUsers] = useState(null);

    useEffect(() => {
        listUsers().then((userList) => setUsers(userList));
    }, []);

    return <div>
        <h1>pK</h1>
        <UserList users={users} />
    </div>;
}

export {
    App,
};
