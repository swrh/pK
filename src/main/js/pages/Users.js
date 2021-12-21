'use strict'

import React, { useEffect, useState } from 'react'

import UserList from '../UserList'

import { listUsers } from '../api/pK'

export default () => {
    const [users, setUsers] = useState(null);

    useEffect(() => {
        listUsers().then((userList) => setUsers(userList));
    }, []);

    return <UserList users={users} />
}
