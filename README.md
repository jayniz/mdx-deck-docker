# Run mdx-deck with docker

## Build a fresh image yourself

Check out what the current [mdx-deck](https://github.com/jxnblk/mdx-deck)
version is and run

```shell
git clone https://github.com/jayniz/mdx-deck-docker.git && cd mdx-deck-docker
MDX_DECK_VERSION=insert_current_version_here make build tag start
```

Then point your browser at http://localhost:8080 and enjoy your presentation.

## Run an image built by me

These are probably outdated, but you can also just run pre built images right
from docker hub:

```shell
echo "# this is my presentation" > deck.mdx
docker run -ti -v $(shell pwd)/deck.mdx:/home/node/mdx-deck/deck.mdx:cached -p 8080:8080 jannis/mdx-deck
```

Then point your browser at http://localhost:8080 and enjoy your presentation.
