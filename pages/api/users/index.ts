import { NextApiRequest, NextApiResponse } from 'next'
import { WithId } from 'mongodb'
import { connectPromise, database } from '../../../lib/mongodb'

const userCollection = database.collection('users')

const userFields = [
    'name',
    'email',
]

interface UserDoc {
    name?: string
    email?: string
}

interface ErrorResult {
    error: string
}

const extractDocument = (body: UserDoc) => {
    const document: UserDoc = {}
    userFields.forEach((field) => {
        const value = body[field as keyof UserDoc]
        if (value !== undefined) {
            document[field as keyof UserDoc] = value
        }
    })
    return document
}

const usersIndex = async (req: NextApiRequest, res: NextApiResponse<WithId<UserDoc> | WithId<UserDoc>[] | ErrorResult>) => {
    await connectPromise

    if (req.method === 'GET') {
        const document = await userCollection
            .find()
            .toArray()

        res.json(document)
    } else if (req.method === 'POST') {
        const document = extractDocument(req.body)

        await userCollection
            .insertOne(document)
        // document should now include _id

        res.json(document as WithId<typeof document>)
    } else {
        res.status(405).json({
            error: '405 Method Not Allowed',
        })
    }
}

export default usersIndex
