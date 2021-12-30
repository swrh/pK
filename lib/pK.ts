import axios from 'axios'
import { DeleteResult, ObjectId, WithId } from 'mongodb'

export interface User {
    name: string;
    email: string;
}

export interface Department {
    name: string;
}

const DELAY = 500

type Delay = {
    (t: number): Promise<unknown>;
    <T>(t: number, v: T): Promise<T>;
}

const delay: Delay = <T>(t: number, v?: T) =>
    new Promise((resolve) =>
        setTimeout(resolve.bind(null, v), t))

const createDepartment = (data: Department) =>
    delay(DELAY).then(() => axios.post('/api/departments', data)
        .then((response) => response.data as WithId<Department>)
        .then((response) => delay(DELAY, response)))

const deleteDepartment = (id: ObjectId) =>
    delay(DELAY).then(() => axios.delete(`/api/departments/${id}`)
        .then((response) => response.data as DeleteResult)
        .then((response) => delay(DELAY, response)))

const getDepartment = (id: ObjectId) =>
    delay(DELAY).then(() => axios.get(`/api/departments/${id}`)
        .then((response) => response.data as WithId<Department>)
        .then((response) => delay(DELAY, response)))

const listDepartments = () =>
    delay(DELAY).then(() => axios.get('/api/departments')
        .then((response) => response.data as WithId<Department>[])
        .then((response) => delay(DELAY, response)))

const updateDepartment = (id: ObjectId, data: Department) =>
    delay(DELAY).then(() => axios.put(`/api/departments/${id}`, data)
        .then((response) => response.data as WithId<Department>)
        .then((response) => delay(DELAY, response)))

const createUser = (data: User) =>
    delay(DELAY).then(() => axios.post('/api/users', data)
        .then((response) => response.data as WithId<User>)
        .then((response) => delay(DELAY, response)))

const deleteUser = (id: ObjectId) =>
    delay(DELAY).then(() => axios.delete(`/api/users/${id}`)
        .then((response) => response.data as DeleteResult)
        .then((response) => delay(DELAY, response)))

const getUser = (id: ObjectId) =>
    delay(DELAY).then(() => axios.get(`/api/users/${id}`)
        .then((response) => response.data as WithId<User>)
        .then((response) => delay(DELAY, response)))

const listUsers = () =>
    delay(DELAY).then(() => axios.get('/api/users')
        .then((response) => response.data as WithId<User>[])
        .then((response) => delay(DELAY, response)))

const updateUser = (id: ObjectId, data: User) =>
    delay(DELAY).then(() => axios.put(`/api/users/${id}`, data)
        .then((response) => response.data as WithId<User>)
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
