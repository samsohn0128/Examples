import { Link } from 'react-router-dom';

const UserList = ({ users }) => {
    const userMap = users.map(user => {
        return (
            <div className="card m-2" key={user.id}>
                <div className="card-body p-3">
                    <Link to={`/users/${user.id}`}>{user.name}</Link>
                </div>
            </div>
        );
    });

    return (
        <div>
            {userMap}
        </div>
    );
}

export default UserList;