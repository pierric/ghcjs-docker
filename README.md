# ghcjs-docker
Dockerfile for ghcjs image

## Example

Suppose we have a **app**, which has a directory structure:
```
+. app
 |
 +- jsbits
 |
 +- src
 |
 +- stack.yaml
 |
 `- app.cabal
```

We can build the app with following Dockfile.
```
FROM jason86/ghcjs:0.2.0.9006030_ghc-7.10.3

USER root
ADD client /home/ghcjs/app
RUN chown ghcjs:ghcjs /home/ghcjs/app

USER ghcjs
WORKDIR /home/ghcjs/app

RUN stack build
```

All the compiled javascript files are in the directory `$(stack path --stack-yaml=client/stack.yaml --local-install-root)/bin/app.jsexe/`
