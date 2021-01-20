clone:
	git submodule update --init --recursive

build:
	npm install -D --save autoprefixer
	npm install -D --save postcss-cli
	HUGO_ENV="production" hugo --gc