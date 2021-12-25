import {Streamlit} from "streamlit-component-lib"

const targetWindow: Window = window.parent;

const hashChangeHandler = () => {
    Streamlit.setComponentValue(targetWindow.location.hash)
}

targetWindow.addEventListener('hashchange', hashChangeHandler)
Streamlit.setComponentReady()
hashChangeHandler()
Streamlit.setFrameHeight(0)