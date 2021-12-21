'use strict'

import React, { useEffect, useState } from 'react'

import DepartmentList from '../DepartmentList'

import { listDepartments } from '../api/pK'

export default () => {
    const [departments, setDepartments] = useState(null);

    useEffect(() => {
        listDepartments().then((departmentsList) => setDepartments(departmentsList));
    }, []);

    return <DepartmentList departments={departments} />
}
