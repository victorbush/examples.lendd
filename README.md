# Let's Encrypt + NGINX + DNS + Docker

Or LENDD for short.

## Introduction

Read the explanation article here: [TODO]

This repository exists solely to document the process of using NGINX and Let's Encrypt together in a Docker container.

## tl;dr

1. Checkout or download this repository.
2. Configure the Dehydrated client:
    * Update `mount/etc/dehydrated/domains.txt` for your domains.
    * Update `mount/etc/dehydrated/dehydrated.hooks.sh` to perform any desired actions.
    * Update `mount/etc/dehydrated/config` with your email address and any other desired settings.
3. Configure NGINX as needed (beyond the scope of this example).
3. Build the Docker image:
```
docker build -t nginx-dehydrated -f ./src/Dockerfile .
```
4. Create and run a Docker container:
```
docker run \
    -d \
    --name revprox \
    --restart unless-stopped \
    -p 80:80 \
    -p 443:443 \
    -e PROVIDER=cloudflare \
    -e LEXICON_CLOUDFLARE_USERNAME=yourcloudflarelogin@example.com \
    -e LEXICON_CLOUDFLARE_TOKEN=1231231231321321321321321321321321 \
    -v /host/path/to/mount/etc/dehydrated:/etc/dehydrated \
    -v /host/path/to/mount/etc/nginx/conf.d:/etc/nginx/conf.d \
    nginx-dehydrated
```
