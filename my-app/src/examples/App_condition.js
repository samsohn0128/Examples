import { useState, useEffect } from 'react';

function App() {
    const [condition, setCondition] = useState(false);

    const toggle = () => setCondition(!condition);

    useEffect(() => {
        console.log(condition);
    }, [condition]);

    const renderCondition = condition ? 'True' : 'False';

    return (
        <div className="App">
            <h1>Boong Bara</h1>
            <div>{renderCondition}</div>
            <p>{condition ? 'False' : 'True'}</p>
            <button onClick={toggle}>Toggle</button>
        </div>
    );
}

export default App;
