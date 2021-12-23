'use strict'

import React, { useEffect, useState } from 'react'

import { useNavigate } from 'react-router'
import { Link } from 'react-router-dom'

import { deleteDepartment, listDepartments } from '../../api/pK'

import DepartmentList from '../../DepartmentList'

export default () => {
    const [departments, setDepartments] = useState(null)
    const navigate = useNavigate()

    useEffect(() => {
        let isMounted = true

        let refreshList = () => {
            listDepartments().then((departmentsList) => {
                if (!isMounted)
                    return

                const onEditClick = (department) => {
                    navigate('' + department.id)
                }

                const onDeleteClick = (department) => {
                    setDepartments(null)
                    deleteDepartment(department.id)
                        .finally((response) => {
                            if (refreshList !== null)
                                refreshList()
                        })
                }

                departmentsList.forEach((department) => {
                    department.links = <>
                        <button onClick={() => onEditClick(department)}>Edit</button>
                        <button onClick={() => onDeleteClick(department)}>Delete</button>
                    </>
                })

                setDepartments(departmentsList)
            })
        }

        refreshList()

        return () => {
            isMounted = false
            refreshList = null
        }
    }, [])

    return <div>
        <h1>Departments</h1>
        <DepartmentList departments={departments} />
        <br />
        <Link to={'/departments/new'}>New</Link>
    </div>
}
