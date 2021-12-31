import Link from 'next/link'
import { useEffect, useState } from 'react'

import { deleteDepartment, Department, listDepartments } from '../../lib/pK'

import DepartmentList, { DepartmentRow } from '../../lib/DepartmentList'
import { WithId } from 'mongodb'

export default () => {
    const [rows, setRows] = useState<DepartmentRow[] | null>(null)

    useEffect(() => {
        let isMounted = true

        let refreshList = () => {
            listDepartments().then((departmentsList) => {
                if (!isMounted)
                    return

                const onDeleteClick = (department: WithId<Department>) => {
                    setRows(null)
                    deleteDepartment(department._id)
                        .finally(refreshList)
                }

                setRows(departmentsList.map((department): DepartmentRow => ({
                    id: department._id,
                    name: department.name,
                    links: <>
                        <Link href={`/departments/${department._id}`}><a>Edit</a></Link>
                        <Link href=''><a onClick={() => onDeleteClick(department)}>Delete</a></Link>
                    </>,
                })))
            })
        }

        refreshList()

        return () => {
            isMounted = false
            refreshList = () => undefined
        }
    }, [])

    return <div>
        <h1>Departments</h1>
        <DepartmentList departments={rows} />
        <br />
        <Link href={'/departments/new'}><a>New</a></Link>
    </div>
}
