'use strict';

import React from 'react';

import axios from 'axios'

const delay = (t, v) => {
    return new Promise((resolve) => {
        setTimeout(resolve.bind(null, v), t);
    });
}

const listDepartments = () =>
    axios.get('/api/departments')
        .then((response) => delay(1000, response.data._embedded.departments));

const listUsers = () =>
    axios.get('/api/users')
        .then((response) => delay(1000, response.data._embedded.users));

export {
    listDepartments,
    listUsers,
}
