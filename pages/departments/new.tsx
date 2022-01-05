import Head from 'next/head'
import Link from 'next/link'

export default () => {
    return <div>
        <Head>
            <title>pK | New Department</title>
        </Head>

        <h1>New</h1>

        <Link href='/departments'><a>Back</a></Link>
    </div>
}
