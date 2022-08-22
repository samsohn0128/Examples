import { Link, NavLink } from "react-router-dom";

const Navbar = () => {
    return (
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <Link className="navbar-brand" to="/">Home</Link>
            <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
            </button>
            <div className="collapse navbar-collapse" id="navbarNav">
                <ul className="navbar-nav">
                    <li className="nav-item">
                        <NavLink
                            className={({ isActive }) => isActive ? "active nav-link" : "nav-link"}
                            to="/movies"
                        >
                            Movies
                        </NavLink>
                    </li>
                    <li className="nav-item">
                        <NavLink
                            className={({ isActive }) => isActive ? "active nav-link" : "nav-link"}
                            to="/users"
                        >
                            Users
                        </NavLink>
                    </li>
                </ul>
            </div>
            <input type="text" />
        </nav>
    );
};

export default Navbar;