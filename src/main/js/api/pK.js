'use strict'

import React from 'react'

import axios from 'axios'

const DELAY = 500

const delay = (t, v) =>
    new Promise((resolve) =>
        setTimeout(resolve.bind(null, v), t))

const createDepartment = (data) =>
    delay(DELAY).then(() => axios.post('/api/departments', data)
        .then((response) => delay(DELAY, response)))

const deleteDepartment = (id) =>
    delay(DELAY).then(() => axios.delete(`/api/departments/${id}`)
        .then((response) => delay(DELAY, response)))

const getDepartment = (id) =>
    delay(DELAY).then(() => axios.get(`/api/departments/${id}`)
        .then((response) => response.data)
        .then((response) => delay(DELAY, response)))

const listDepartments = () =>
    delay(DELAY).then(() => axios.get('/api/departments')
        .then((response) => response.data._embedded.departments)
        .then((response) => delay(DELAY, response)))

const updateDepartment = (id, data) =>
    delay(DELAY).then(() => axios.put(`/api/departments/${id}`, data)
        .then((response) => delay(DELAY, response)))

const createUser = (data) =>
    delay(DELAY).then(() => axios.post('/api/users', data)
        .then((response) => delay(DELAY, response)))

const deleteUser = (id) =>
    delay(DELAY).then(() => axios.delete(`/api/users/${id}`)
        .then((response) => delay(DELAY, response)))

const getUser = (id) =>
    delay(DELAY).then(() => axios.get(`/api/users/${id}`)
        .then((response) => response.data)
        .then((response) => delay(DELAY, response)))

const listUsers = () =>
    delay(DELAY).then(() => axios.get('/api/users')
        .then((response) => response.data._embedded.users)
        .then((response) => delay(DELAY, response)))

const updateUser = (id, data) =>
    delay(DELAY).then(() => axios.put(`/api/users/${id}`, data)
        .then((response) => delay(DELAY, response)))

export {
    createDepartment,
    deleteDepartment,
    getDepartment,
    listDepartments,
    updateDepartment,
    createUser,
    deleteUser,
    getUser,
    listUsers,
    updateUser,
}
