from pathlib import Path
from typing import Optional

from streamlit.components.v1 import components

build_path = Path(__file__).parent / 'build'
_component_func = components.declare_component("get_fragment", path=str(build_path))


def get_fragment() -> Optional[str]:
    return _component_func()
