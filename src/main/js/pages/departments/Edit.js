'use strict'

import React, { useEffect, useState } from 'react'
import { Navigate, useParams } from 'react-router'
import { Link } from 'react-router-dom'

import { getDepartment, updateDepartment } from '../../api/pK'

export default () => {
    const { id } = useParams()
    const [department, setDepartment] = useState(null)

    const [disabled, setDisabled] = useState(true)
    const [done, setDone] = useState(false)
    const [error, setError] = useState(null)

    const [data, setData] = useState({
        name: { value: department !== null ? department.name : '', error: null },
    })

    useEffect(() => {
        let isMounted = true

        getDepartment(id)
            .then((department) => {
                if (!isMounted)
                    return

                setDepartment(department)

                for (const field in data) {
                    const uf = department[field]
                    if (uf === undefined)
                        continue
                    const df = data[field]
                    df.value = uf
                }

                setDisabled(false)
            })
        return () => {
            isMounted = false
        }
    }, [])

    const handleInput = (field, value) => {
        const fd = data[field]

        let error = null
        if (!value) {
            error = 'Cannot be empty'
        }

        if (fd.value != value || fd.error != error) {
            fd.value = value
            fd.error = error
            setData({ ...data })
        }

        return fd.error === null
    }

    const handleValidation = () => {
        let valid = true
        for (const field in data) {
            if (!handleInput(field, data[field].value))
                valid = false
        }
        return valid
    }

    const handleSubmit = (e) => {
        e.preventDefault()

        if (!handleValidation())
            return

        setDisabled(true)
        setError(null)

        const apiData = {
            name: data.name.value,
        }

        updateDepartment(id, apiData)
            .then((response) => {
                if (response.status === 200)
                    setDone(true)
            })
            .catch((reason) => {
                setError('' + reason)
            })
            .finally(() => {
                setDisabled(false)
            })
    }

    if (done)
        return <Navigate to='/departments' />

    return <div>
        <h1>Department #{id}</h1>
        <form onSubmit={handleSubmit}>
            <fieldset disabled={disabled}>
                <label>Name: <input type='text' name='name' value={data.name.value} onChange={(e) => handleInput('name', e.target.value)} /></label><br />
                {data.name.error ? <><span>{data.name.error}</span><br /></> : ''}
                <br />
                <input type='submit' value='Submit' />
                {error ? <><br /><span>{error}</span></> : ''}
            </fieldset>
        </form>
        <br />
        <Link to='/departments'>Back</Link>
    </div>
}
