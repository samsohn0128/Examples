import { useState } from 'react'

const useCounter = (initialValue) => {
    const [count, setCount] = useState(initialValue)

    const increaseCount = () => setCount((count) => count + 1)
    const decreaseCount = () => setCount((count) => count - 1)

    return [count, increaseCount, decreaseCount]
}

export default useCounter