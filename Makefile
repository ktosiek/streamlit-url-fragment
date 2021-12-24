version = 0.1.0

python_sources = $(wildcard streamlit_query_fragment/*.py) pyproject.toml
js_sources := $(wildcard streamlit_query_fragment/public/*) $(wildcard streamlit_query_fragment/src/*) streamlit_query_fragment/tsconfig.json
js_npm_install_marker = streamlit_query_fragment/node_modules/.package-lock.json


build: \
	streamlit_query_fragment/build/index.html \
	dist/streamlit-query-fragment-$(version).tar.gz \
	dist/streamlit_query_fragment-$(version)-py3-none-any.whl

dist/streamlit-query-fragment-$(version).tar.gz: $(python_sources) streamlit_query_fragment/build/index.html
	poetry build -f sdist

dist/streamlit_query_fragment-$(version)-py3-none-any.whl: $(python_sources) streamlit_query_fragment/build/index.html
	poetry build -f wheel

streamlit_query_fragment/build/index.html: $(js_sources) $(js_npm_install_marker)
	cd streamlit_query_fragment && npm run build

$(js_npm_install_marker): streamlit_query_fragment/package-lock.json
	cd streamlit_query_fragment && npm install

clean:
	-rm -r -f dist/* streamlit_query_fragment/build/*
