import { useState, useEffect } from 'react';
import axios from 'axios';
import UserList from '../components/UserList';
import Spinner from '../components/Spinner';

const Users = () => {
    const [users, setUsers] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        axios.get('https://jsonplaceholder.typicode.com/users')
            .then(response => {
                setUsers(response.data);
                setLoading(false);
            });
    }, [])

    return (
        <div>
            <h1>Users</h1>
            {loading ? <Spinner /> : <UserList users={users} />}
        </div>
    )
}

export default Users;