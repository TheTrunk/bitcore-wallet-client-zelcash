.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	bitcore-wallet-client-zelcash.min.js

clean:
	rm bitcore-wallet-client-zelcash.js
	rm bitcore-wallet-client-zelcash.min.js

bitcore-wallet-client-zelcash.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

bitcore-wallet-client-zelcash.min.js: bitcore-wallet-client-zelcash.js
	uglifyjs   $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
