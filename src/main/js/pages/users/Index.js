'use strict'

import React, { useEffect, useState } from 'react'

import UserList from '../../UserList'

import { deleteUser, listUsers } from '../../api/pK'
import { Link } from 'react-router-dom'

export default () => {
    const [users, setUsers] = useState(null)

    useEffect(() => {
        let isMounted = true

        let refreshList = () => {
            listUsers().then((usersList) => {
                if (!isMounted)
                    return

                const onDeleteClick = (user) => {
                    setUsers(null)
                    deleteUser(user.id)
                        .finally((response) => {
                            if (refreshList !== null)
                                refreshList()
                        })
                }

                usersList.forEach((user) => {
                    user.links = <button onClick={() => onDeleteClick(user)}>Delete</button>
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

    return <>
        <UserList users={users} />
        <Link to={'/users/new'}>New</Link>
    </>
}
