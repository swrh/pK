'use strict'

import React, { useEffect, useState } from 'react'

import { useNavigate } from 'react-router'
import { Link } from 'react-router-dom'

import { deleteUser, listUsers } from '../../api/pK'

import UserList from '../../UserList'

export default () => {
    const [users, setUsers] = useState(null)
    const navigate = useNavigate()

    useEffect(() => {
        let isMounted = true

        let refreshList = () => {
            listUsers().then((usersList) => {
                if (!isMounted)
                    return

                const onEditClick = (user) => {
                    navigate('' + user.id)
                }

                const onDeleteClick = (user) => {
                    setUsers(null)
                    deleteUser(user.id)
                        .finally((response) => {
                            if (refreshList !== null)
                                refreshList()
                        })
                }

                usersList.forEach((user) => {
                    user.links = <>
                        <button onClick={() => onEditClick(user)}>Edit</button>
                        <button onClick={() => onDeleteClick(user)}>Delete</button>
                    </>
                })

                setUsers(usersList)
            })
        }

        refreshList()

        return () => {
            isMounted = false
            refreshList = null
        }
    }, [])

    return <div>
        <h1>Users</h1>
        <UserList users={users} />
        <br />
        <Link to={'/users/new'}>New</Link>
    </div>
}
