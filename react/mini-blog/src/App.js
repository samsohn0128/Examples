import './App.css';
import MainPage from "./component/page/MainPage";
import {BrowserRouter, Route, Routes} from "react-router-dom";
import styled from "styled-components";
import PostWritePage from "./component/page/PostWritePage";
import PostViewPage from "./component/page/PostViewPage";

const MainTitleText = styled.p`
  font-size: 24px;
  font-weight: bold;
  text-align: center;
`

function App() {
  return (
    <BrowserRouter>
        <MainTitleText>붕붕바라바라붕붕</MainTitleText>
        <Routes>
            <Route index element={<MainPage />}/>
            <Route path="post-write" element={<PostWritePage />} />
            <Route path="posts/:postId" element={<PostViewPage />} />
        </Routes>
    </BrowserRouter>
  );
}

export default App;
