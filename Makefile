version = 0.1.0

python_sources = $(wildcard streamlit_url_fragment/*.py) pyproject.toml MANIFEST.in
js_sources := $(wildcard streamlit_url_fragment/public/*) $(wildcard streamlit_url_fragment/src/*) streamlit_url_fragment/tsconfig.json
js_npm_install_marker = streamlit_url_fragment/node_modules/.package-lock.json

build: streamlit_url_fragment/build/index.html sdist wheels

sdist: dist/streamlit-url-fragment-$(version).tar.gz
wheels: dist/streamlit_url_fragment-$(version)-py3-none-any.whl

dist/streamlit-url-fragment-$(version).tar.gz: $(python_sources) streamlit_url_fragment/build/index.html
	poetry build -f sdist

dist/streamlit_url_fragment-$(version)-py3-none-any.whl: $(python_sources) streamlit_url_fragment/build/index.html
	poetry build -f wheel

streamlit_url_fragment/build/index.html: $(js_sources) $(js_npm_install_marker)
	cd streamlit_url_fragment && npm run build

$(js_npm_install_marker): streamlit_url_fragment/package-lock.json
	cd streamlit_url_fragment && npm install

clean:
	-rm -r -f dist/* streamlit_url_fragment/build/*
