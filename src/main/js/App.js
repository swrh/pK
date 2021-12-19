'use strict';

import { useEffect, useState } from 'react';

import client from './client';

import { UserList } from './UserList';

const React = require('react');

const App = () => {
    const [users, setUsers] = useState(null);

    useEffect(() => {
        client({
            method: 'GET',
            path: '/api/users',
        }).done((response) => {
            setTimeout(() => {
                setUsers(response.entity._embedded.users);
            }, 1000);
        });
    }, []);

    return <div>
        <h1>pK</h1>
        <UserList users={users} />
    </div>;
}

export {
    App,
};
