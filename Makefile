ifndef MDX_DECK_VERSION
MDX_DECK_VERSION ?= $(shell bash -c 'read -p "mdx-deck version: " version; echo $$version')
endif

DOCKER_CMD=docker run -ti -v $(shell pwd)/deck.mdx:/home/node/mdx-deck/deck.mdx:cached -p 8080:8080 jannis/mdx-deck:$(MDX_DECK_VERSION)


default: build tag

build:
	docker build --build-arg MDX_DECK_VERSION=$(MDX_DECK_VERSION) -t jannis/mdx-deck .

tag:
	docker tag jannis/mdx-deck jannis/mdx-deck:$(MDX_DECK_VERSION)

push: build tag
	docker push jannis/mdx-deck:$(MDX_DECK_VERSION)

console:
	$(DOCKER_CMD) bash

start:
	$(DOCKER_CMD) npm start
