FROM node:11-alpine

RUN npm i -g asciidoctor-plantuml@^1.0.2 @antora/cli@latest @antora/site-generator-default@latest

WORKDIR /antora

ENTRYPOINT [ "antora" ]
