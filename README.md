# References
- [Transmission](https://github.com/transmission/transmission)
- [depends](https://github.com/transmission/transmission/issues/801#issuecomment-451660375)
- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/#dockerfile-examples)
- [Transmission WebUI](https://github.com/ronggang/transmission-web-control)

# Usage
```shell
git clone git@github.com:Humsan/transmission-on-docker.git && cd transmission-on-docker/
# according your requirement to edit config/settings.json
mkdir ~/download
docker run -i -t -d --name=transmission -v ./config:/etc/transmission/config -v ~/download:/download -p 9091:9091 masker/transmission:v0.2

```
