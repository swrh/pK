'use strict'

import React, { useEffect, useState } from 'react'

import DepartmentList from '../DepartmentList'

import { listDepartments } from '../api/pK'

export default () => {
    const [departments, setDepartments] = useState(null);

    useEffect(() => {
        let isMounted = true;

        listDepartments().then((departmentsList) => {
            if (isMounted)
                setDepartments(departmentsList);
        });

        return () => {
            isMounted = false;
        }
    }, []);

    return <DepartmentList departments={departments} />
}