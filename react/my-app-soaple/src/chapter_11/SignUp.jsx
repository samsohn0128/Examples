import {useState} from "react";

const SignUp = () => {
    const [name, setName] = useState('')
    const [gender, setGender] = useState('male')

    const handleChangeName = (event) => {
        setName(event.target.value)
    }

    const handleChangeGender = (event) => {
        setGender(event.target.value)
    }

    const handleSubmit = (event) => {
        alert(`이름: ${name}, 성별: ${gender}`)
        event.preventDefault()
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>
                이름:
                <input type="text" value={name} onChange={handleChangeName} />
            </label>
            <br />
            <label>
                이름:
                <select value={gender} onChange={handleChangeGender}>
                    <option value="male">남자</option>
                    <option value="female">여자</option>
                </select>
            </label>
            <button type="submit">제출</button>
        </form>
    )
}

export default SignUp