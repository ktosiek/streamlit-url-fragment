import {Streamlit} from "streamlit-component-lib"

const topWindow: Window = window.top || window;

const hashChangeHandler = () => {
    Streamlit.setComponentValue(topWindow.location.hash)
}

topWindow.addEventListener('hashchange', hashChangeHandler)
Streamlit.setComponentReady()
hashChangeHandler()
Streamlit.setFrameHeight(0)