import { ObjectId } from 'mongodb'
import { NextPage } from 'next'
import { useMemo } from 'react'

import Table from './Table'

export interface DepartmentRow {
    id: ObjectId
    name: string
    links: JSX.Element
}

type Props = {
    departments: DepartmentRow[] | null
}

const DepartmentList: NextPage<Props> = ({ departments }) => {
    if (departments === null) {
        return <p>Loading...</p>;
    }

    const columns = useMemo(() => [
        { Header: 'Id', accessor: 'id', },
        { Header: 'Name', accessor: 'name', },
        { Header: '', accessor: 'links', },
    ], []);

    const data = useMemo(() => departments, []);

    return <Table columns={columns} data={data} />
}

export default DepartmentList
