# docker images 

## antora-plantuml

Docker image for antora extended with plantuml support.

### How to run?

```
docker run -v `pwd`:/antora hauer/antora-plantuml site.yml
```

Notice that *you need a plantuml server*. You may use a public one (http://www.plantuml.com/plantuml) or a local one:

```
docker run -d -p 8080:8080 plantuml/plantuml-server
```
