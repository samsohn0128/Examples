import styled from "styled-components";

const Wrapper = styled.div`
    padding: 1rem;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: space-around;
    background-color: lightgrey;
`

const Block = styled.div`
    padding: ${props => props.padding};
    border: 1px solid black;
    border-radius: 1rem;
    background-color: ${props => props.backgroundColor};
    color: white;
    font-size: 2rem;
    font-weight: bold;
    text-align: center;
    margin: 10px;
`

const blockItems = [
    {
        label: "1",
        padding: "1rem",
        backgroundColor: "red",
    },
    {
        label: "2",
        padding: "3rem",
        backgroundColor: "green",
    },
    {
        label: "3",
        padding: "10rem",
        backgroundColor: "blue",
    },
]

const Blocks = () => {
    return (
        <Wrapper>
            {blockItems.map((blockItem, index) => {
                return (
                    <Block
                        padding={blockItem.padding}
                        backgroundColor={blockItem.backgroundColor}
                        key={index}
                        >
                        {blockItem.label}
                    </Block>
                )
            })}
        </Wrapper>
    )
}

export default Blocks