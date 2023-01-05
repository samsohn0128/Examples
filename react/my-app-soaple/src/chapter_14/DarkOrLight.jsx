import {useState, useCallback} from "react"
import ThemeContext from "./ThemeContext"
import MainContent from "./MainContent"

const DarkOrLight = () => {
    const [theme, setTheme] = useState('#0x000000')
    const [backgroundTheme, setBackgroundTheme] = useState('#0xffffff')

    const createRandomColor = () => "#" + Math.round(Math.random() * 0xffffff).toString(16)

    const toggleTheme = useCallback(() => {
        setTheme(createRandomColor())
        setBackgroundTheme(createRandomColor())
    }, [])

    return (
        <ThemeContext.Provider value={{theme, backgroundTheme, toggleTheme}}>
            <MainContent />
        </ThemeContext.Provider>
    )
}

export default DarkOrLight