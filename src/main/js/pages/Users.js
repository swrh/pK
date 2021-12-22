'use strict'

import React, { useEffect, useState } from 'react'

import UserList from '../UserList'

import { listUsers } from '../api/pK'

export default () => {
    const [users, setUsers] = useState(null);

    useEffect(() => {
        let isMounted = true;

        listUsers().then((usersList) => {
            if (isMounted)
                setUsers(usersList);
        });

        return () => {
            isMounted = false;
        }
    }, []);

    return <UserList users={users} />
}
