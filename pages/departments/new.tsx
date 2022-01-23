import Head from 'next/head'
import Link from 'next/link'

const departmentsNew = () => {
    return <div>
        <Head>
            <title>pK | New Department</title>
        </Head>

        <h1>New</h1>

        <Link href='/departments'><a>Back</a></Link>
    </div>
}

export default departmentsNew
