'use strict'

import React from 'react'

import axios from 'axios'

const DELAY = 1000

const delay = (t, v) =>
    new Promise((resolve) =>
        setTimeout(resolve.bind(null, v), t))

const listDepartments = () =>
    axios.get('/api/departments')
        .then((response) => delay(DELAY, response.data._embedded.departments))

const createUser = (data) =>
    axios.post('/api/users', data)
        .then((response) => delay(DELAY, response))

const deleteUser = (id) =>
    axios.delete(`/api/users/${id}`)
        .then((response) => delay(DELAY, response))

const getUser = (id) =>
    axios.get(`/api/users/${id}`)
        .then((response) => delay(DELAY, response.data))

const listUsers = () =>
    axios.get('/api/users')
        .then((response) => delay(DELAY, response.data._embedded.users))

const updateUser = (id, data) =>
    axios.put(`/api/users/${id}`, data)
        .then((response) => delay(DELAY, response))

export {
    listDepartments,
    createUser,
    deleteUser,
    getUser,
    listUsers,
    updateUser,
}
