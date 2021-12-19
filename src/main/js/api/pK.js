'use strict';

import React from 'react';

import client from './client';

const listDepartments = () => {
    return new Promise((resolve, reject) => {
        client({
            method: 'GET',
            path: '/api/departments',
        }).done((response) => {
            setTimeout(() => {
                resolve(response.entity._embedded.departments);
            }, 1000);
        });
    });
}

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
    listDepartments,
    listUsers,
}
