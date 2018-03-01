#################################################
# nginx-dehydrated
#
# Example PowerShell script to build the Docker image.
#################################################

# Move into the source directory to build
Push-Location ./src

# Build the image
docker build -t nginx-dehydrated .

# Restore working directory
Pop-Location