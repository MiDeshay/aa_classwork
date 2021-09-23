import React from 'react'

export default ({bench}) => {
    return (
        <li>
            {bench.description}
            {bench.lat}
            {bench.lng}
        </li>
    )
}