'use strict'

import React from 'react'

import axios from 'axios'

const DELAY = 1000

const delay = (t, v) =>
    new Promise((resolve) =>
        setTimeout(resolve.bind(null, v), t))

const listDepartments = () =>
    axios.get('/api/departments')
        .then((response) =>
            delay(DELAY, response.data._embedded.departments))

const listUsers = () =>
    axios.get('/api/users')
        .then((response) =>
            delay(DELAY, response.data._embedded.users))

const createUser = (user) =>
    axios.post('/api/users', user)
        .then((response) =>
            delay(DELAY, response))

export {
    listDepartments,
    listUsers,
    createUser,
}
