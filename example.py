import streamlit as st


st.header("""Access query fragment (query "hash") from Streamlit""")

with st.echo():
    from streamlit_query_fragment import get_fragment

    current_value = get_fragment()
    st.write(f"Current value: {current_value!r}")

col1, col2 =  st.columns(2)
with col1:
    st.subheader("Header 1")
    """You can click on the link next to a header to see the fragment change."""

with col2:
    st.subheader("Header 2")

values_seen = st.session_state.setdefault('values_seen', [])
if not values_seen or values_seen[-1] != current_value:
    values_seen.append(current_value)

st.header("Handling None")
"""
When loading a page, the first value of get_fragment() will be `None`. This is just how Streamlit custom components work.
When the hash part of URL is empty, `get_fragment()` will return an empty string.

If you need to wait for the actual value, you can use st.stop():
"""
with st.echo():
    if current_value is None:
        st.stop()
    assert current_value is not None, \
        "Now we know we have the current value."

st.write("Values of get_fragment() seen in this session:")
st.write(values_seen)
