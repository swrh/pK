'use strict';

import React, { useMemo } from 'react';

import { Table } from './Table';

const DepartmentList = ({ departments }) => {
    if (departments === null) {
        return <p>Loading...</p>;
    }

    const columns = useMemo(() => [
        { Header: 'Id', accessor: 'id', },
        { Header: 'Name', accessor: 'name', },
    ], []);

    const data = useMemo(() => departments, []);

    return <Table columns={columns} data={data} />
}

export {
    DepartmentList,
}
