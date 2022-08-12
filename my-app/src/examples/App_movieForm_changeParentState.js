import { useState } from 'react';
import Movie from './components/Movie';
import MovieForm from './components/MovieForm';

function App() {
    const [movies, setMovies] = useState([
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
    ]);

    const addMovie = (movie) => {
        setMovies([
            ...movies,
            movie
        ])
    };

    const renderMovies = movies.map(movie => {
        return (
            <Movie movie={movie} key={movie.title} />
        );
    });

    return (
        <div className="App">
            <h1>Boong Bara</h1>
            <MovieForm addMovie={addMovie} />
            {renderMovies}
        </div>
    );
}

export default App;
