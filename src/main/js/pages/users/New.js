'use strict'

import React, { useState } from 'react'
import { Navigate } from 'react-router'
import { Link } from 'react-router-dom'

import { createUser } from '../../api/pK'

export default () => {
    const [disabled, setDisabled] = useState(false)
    const [done, setDone] = useState(false)
    const [error, setError] = useState(null)

    const [data, setData] = useState({
        name: { value: '', error: null },
        email: { value: '', error: null },
    })

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

        const user = {
            name: data.name.value,
            email: data.email.value,
        }

        createUser(user)
            .then((response) => {
                if (response.status === 201)
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
        return <Navigate to='/users' />

    return <div>
        <form onSubmit={handleSubmit}>
            <fieldset disabled={disabled}>
                <label>Name: <input type='text' name='name' value={data.name.value} onChange={(e) => handleInput('name', e.target.value)} /></label><br />
                {data.name.error ? <><span>{data.name.error}</span><br /></> : ''}
                <label>Email: <input type='text' name='email' value={data.email.value} onChange={(e) => handleInput('email', e.target.value)} /></label><br />
                {data.email.error ? <><span>{data.email.error}</span><br /></> : ''}
                <input type='submit' value='Submit' />
                {error ? <><br /><span>{error}</span></> : ''}
            </fieldset>
        </form>
        <Link to='/users'>Back</Link>
    </div>
}
