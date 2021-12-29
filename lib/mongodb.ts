import { Db, MongoClient } from 'mongodb'

declare global {
  var _mongodb: {
    client: MongoClient
    connectPromise: Promise<MongoClient>
    database: Db
  }
}

const uri = process.env.MONGODB_URI
const dbName = process.env.MONGODB_DB
const options = {}

if (!uri) {
  throw new Error('Please define the MONGODB_URI variable in .env.local')
}

if (!dbName) {
  throw new Error('Please define the MONGODB_DB variable in .env.local')
}

const doConnect = () => {
  const client = new MongoClient(uri, options)
  const connectPromise = client.connect()
  const database = client.db(dbName)
  return {
    client,
    connectPromise,
    database,
  }
}

let connection

if (process.env.NODE_ENV === 'development') {
  // In development mode, use a global variable so that the value
  // is preserved across module reloads caused by HMR (Hot Module Replacement).
  if (!global._mongodb) {
    global._mongodb = doConnect()
  }
  connection = global._mongodb
} else {
  // In production mode, it's best to not use a global variable.
  connection = doConnect()
}

const {
  client,
  connectPromise,
  database,
} = connection

export {
  client,
  connectPromise,
  database,
}
