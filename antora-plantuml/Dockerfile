FROM node:11-alpine

RUN npm i -g asciidoctor-plantuml @antora/cli@latest @antora/site-generator-default@latest

WORKDIR /antora

ENTRYPOINT [ "antora" ]
