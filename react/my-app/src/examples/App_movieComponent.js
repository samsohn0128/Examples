import Movie from './components/Movie';

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
        {
            title: 'boongbara4',
            year: 2004,
        },
    ];

    const renderMovies = movies.map(movie => {
        return (
            <Movie movie={movie} key={movie.title} />
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
