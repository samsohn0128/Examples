import { useState } from 'react';
import Movie from './components/Movie';
import MovieForm from './components/MovieForm';

function App() {
    const [movies, setMovies] = useState([]);

    const addMovie = (movie) => {
        setMovies([
            ...movies,
            movie
        ])
    };

    const removeMovie = (id) => {
        setMovies(movies.filter(movie => movie.id !== id));
    };

    const renderMovies = movies.length ? movies.map(movie => {
        return (
            <Movie
                movie={movie}
                removeMovie={removeMovie}
                key={movie.id}
            />
        );
    }) : '추가된 영화가 없습니다.';

    return (
        <div className="App">
            <h1>Boong Bara</h1>
            <MovieForm addMovie={addMovie} />
            {renderMovies}
        </div>
    );
}

export default App;
