import { useEffect, useState } from 'react';
import Movie from './components/Movie';

function App() {
    const [movieTitle, setMovieTitle] = useState('');
    const [movieYear, setMovieYear] = useState('');
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


    useEffect(() => {
        console.log('render');
    });

    const renderMovies = movies.map(movie => {
        return (
            <Movie movie={movie} key={movie.title} />
        );
    });

    const addMovie = (event) => {
        event.preventDefault();

        setMovies([...movies, {
            title: movieTitle,
            year: movieYear
        }]);
        setMovieTitle('');
        setMovieYear('');
    }

    return (
        <div className="App">
            <h1>Boong Bara</h1>
            <form onSubmit={addMovie}>
                <input type="text" value={movieTitle} placeholder='영화 제목' onChange={e => setMovieTitle(e.target.value)} />
                <br />
                <input type="text" value={movieYear} placeholder='개봉 년도' onChange={e => setMovieYear(e.target.value)} />
                <br />
                <button type="submit">영화 추가</button>
            </form>
            {renderMovies}
        </div>
    );
}

export default App;
