'use strict';

import React from 'react';

import client from './client';

const listUsers = () => {
    return new Promise((resolve, reject) => {
        client({
            method: 'GET',
            path: '/api/users',
        }).done((response) => {
            setTimeout(() => {
                resolve(response.entity._embedded.users);
            }, 1000);
        });
    });
}

export {
    listUsers,
}
