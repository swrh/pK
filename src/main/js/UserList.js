'use strict';

import React from 'react';

const UserList = ({ users }) => {
    if (users === null) {
        return <p>Loading...</p>;
    } else {
        return <>
            {users.map((user, i) => <div key={i}>{`${user.name} <${user.email}>`}</div>)}
        </>;
    }
}

export {
    UserList,
}
