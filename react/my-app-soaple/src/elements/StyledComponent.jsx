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

const StyledButton = styled.button`
    color: ${props => props.dark  ? "white" : "black"};
    background: ${props => props.dark ? "black" : "white"};
    border: 1px solid black;
    margin: 5px;
    padding: 10px;
`

const RoundedButton = styled(StyledButton)`
    border-radius: 16px;
`

const StyledComponent = () => {
    return (
        <Wrapper>
            <Title>
                안녕, 리액트!
            </Title>
            <StyledButton>White</StyledButton>
            <StyledButton dark>Black</StyledButton>
            <RoundedButton>Rounded Button</RoundedButton>
            <RoundedButton dark>Dark Rounded Button</RoundedButton>
        </Wrapper>
    )
}

export default StyledComponent