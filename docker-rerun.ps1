#####################################################################
# Example PowerShell script to re-run a Docker container.
#####################################################################

# Stop the existing container (if present)
docker stop revprox

# Remove the old container (if present)
docker rm revprox

# Start the new container
docker run `
    -d `
    --name revprox `
    --restart unless-stopped `
    -p 80:80 `
    -p 443:443 `
    -e PROVIDER=cloudflare `
    -e LEXICON_CLOUDFLARE_USERNAME=yourcloudflarelogin@example.com `
    -e LEXICON_CLOUDFLARE_TOKEN=1231231231321321321321321321321321  `
    -v /host/path/to/mount/etc/dehydrated:/etc/dehydrated `
    -v /host/path/to/mount/etc/nginx/conf.d:/etc/nginx/conf.d `
    nginx-dehydrated
