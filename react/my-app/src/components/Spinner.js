const Spinner = () => {
    return (
        <div className="d-flex justify-content-center">
            <div>
                <div
                    className="spinner-grow"
                    style={{ width: '3rem', height: '3rem' }}
                    role="status"
                >
                    <span className="sr-only">
                        Loading...
                    </span>
                </div>
            </div>
        </div>
    );
}

export default Spinner;