function App() {
    const movies = [
        {
            title: 'boongbara1',
            year: 2001,
        },
        {
            title: 'boongbara2',
            year: 2002,
        },
        {
            title: 'boongbara3',
            year: 2003,
        },
    ];

    const renderMovies = movies.map(movie => {
        return (
            <div className="movie" key={movie.title}>
                <div className="movie-title">{movie.title}</div>
                <div className="movie-year">{movie.year}</div>
            </div>
        );
    });

    return (
        <div className="App">
            <h1>Boong Bara</h1>
            {renderMovies}
        </div>
    );
}

export default App;
