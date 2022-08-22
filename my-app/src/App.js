import {
    BrowserRouter as Router,
    Routes,
    Route,
} from "react-router-dom";
import Navbar from './components/Navbar';
import routes from "./route.js";

function App() {

    return (
        <Router>
            <div className="App">
                <Navbar />
                <div className="container">
                    <Routes>
                        {routes.map(route => {
                            return (
                                <Route
                                    key={route.path}
                                    path={route.path}
                                    element={<route.component />}
                                ></Route>
                            );
                        })}
                    </Routes>
                </div>
            </div>
        </Router >
    );
}

export default App;
