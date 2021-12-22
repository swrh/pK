'use strict';

import React, { useMemo } from 'react';

import Table from './Table';

export default ({ users }) => {
    if (users === null) {
        return <p>Loading...</p>;
    }

    const columns = useMemo(() => [
        { Header: 'Id', accessor: 'id', },
        { Header: 'Name', accessor: 'name', },
        { Header: 'Email', accessor: 'email', },
        { Header: '', accessor: 'links', },
    ], []);

    const data = useMemo(() => users, []);

    return <Table columns={columns} data={data} />
}
