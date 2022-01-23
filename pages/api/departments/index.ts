import { NextApiRequest, NextApiResponse } from 'next'
import { WithId } from 'mongodb'
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

const departmentsIndex = async (req: NextApiRequest, res: NextApiResponse<WithId<DepartmentDoc> | WithId<DepartmentDoc>[] | ErrorResult>) => {
    await connectPromise

    if (req.method === 'GET') {
        const document = await departmentCollection
            .find()
            .toArray()

        res.json(document)
    } else if (req.method === 'POST') {
        const document = extractDocument(req.body)

        await departmentCollection
            .insertOne(document)
        // document should now include _id

        res.json(document as WithId<typeof document>)
    } else {
        res.status(405).json({
            error: '405 Method Not Allowed',
        })
    }
}

export default departmentsIndex
