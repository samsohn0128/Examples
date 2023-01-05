import styled from "styled-components";

const Wrapper = styled.div`
    padding: 1em;
    background: grey;
`

const Title = styled.h1`
    font-size: 1.5em;
    color: white;
    text-align: center;
`

const StyledComponent = () => {
    return (
        <Wrapper>
            <Title>
                안녕, 리액트!
            </Title>
        </Wrapper>
    )
}

export default StyledComponent