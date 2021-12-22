'use strict';

import React from 'react'
import { Link } from 'react-router-dom';

export default () => {
    const links = [
        ['/', 'Home'],
        ['/departments', 'Departments'],
        ['/users', 'Users'],
    ];

    return <nav>
        {links.map((tag, i) => [
            i > 0 && ' | ',
            <Link to={tag[0]} key={i}>{tag[1]}</Link>,
        ])}
    </nav>
}
