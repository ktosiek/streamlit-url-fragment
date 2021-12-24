# Streamlit URL fragment

Get the URL fragment (the part of URL after #) in your Streamlit script:
```python
import streamlit as st
from streamlit_url_fragment import get_fragment

current_value = get_fragment()
st.write("Current value: {!r}".format(get_fragment()))
```

Warning: the first value you'll get will be a `None` - that means the component is still loading.
You can wait for the correct value with `if current_value is None: st.stop()`.