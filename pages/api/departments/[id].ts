import { NextApiRequest, NextApiResponse } from 'next'
import { ObjectId, UpdateResult, WithId } from 'mongodb'
import { connectPromise, database } from '../../../lib/mongodb'

const departmentCollection = database.collection('departments')

const departmentFields = [
    'name',
]

interface DepartmentDoc {
    name?: string
}

interface ErrorResult {
    error: string
}

const extractDocument = (body: DepartmentDoc) => {
    const document: DepartmentDoc = {}
    departmentFields.forEach((field) => {
        const value = body[field as keyof DepartmentDoc]
        if (value !== undefined) {
            document[field as keyof DepartmentDoc] = value
        }
    })
    return document
}

export default async (req: NextApiRequest, res: NextApiResponse<WithId<DepartmentDoc> | ErrorResult>) => {
    let { id } = req.query
    if (typeof id !== 'string') {
        id = '' + id
    }

    await connectPromise

    if (req.method === 'GET') {
        const query = {
            _id: new ObjectId(id),
        }
        const document = await departmentCollection
            .findOne(query)

        if (!document)
            res.status(404).json({
                error: '404 Not Found',
            })
        else
            res.json(document)
    } else if (req.method === 'PATCH') {
        const filter = {
            _id: new ObjectId(id),
        }

        const document = extractDocument(req.body)

        const result = await departmentCollection
            .findOneAndUpdate(filter, {
                $set: document,
            }, {
                returnDocument: 'after',
            })

        if (!result.value)
            res.status(404).json({
                error: '404 Not Found',
            })
        else
            res.json(result.value as WithId<typeof result.value>)
    } else {
        res.status(405).json({
            error: '405 Method Not Allowed',
        })
    }
}
