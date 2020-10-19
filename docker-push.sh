NODE_VERSION="12.19.0"
NODE_MAJOR="12"
DOCKER_HUB_REPO="uncleiroh/meteord-puppeteer"
BASE_IMAGE_NAME="${DOCKER_HUB_REPO}:node-"
IMAGE_NAME_VERSION="${BASE_IMAGE_NAME}${NODE_VERSION}"
IMAGE_NAME_MAJOR="${BASE_IMAGE_NAME}${NODE_MAJOR}"

echo "Starting"

IMAGES="
base
onbuild
devbuild
binbuild
"
echo "Build each tag"


# Push the full versions for each image type.
echo "$IMAGES" | xargs -n1 -I% docker push "${IMAGE_NAME_VERSION}-%"

# Tag them as the major version too, for each image type.
echo "$IMAGES" | xargs -n1 -I% docker tag "${IMAGE_NAME_VERSION}-%" "${IMAGE_NAME_MAJOR}-%"

# Push those major version tags.
echo "$IMAGES" | xargs -n1 -I% docker push "${IMAGE_NAME_MAJOR}-%"

# If this is the default track, tag them with the bare tags.
if [ "$NODE_MAJOR" = "4" ]
then
    echo "$IMAGES" | xargs -n1 -I% docker tag "${IMAGE_NAME_VERSION}-%" "${DOCKER_HUB_REPO}:%"

    echo "$IMAGES" | xargs -n1 -I% docker push "${DOCKER_HUB_REPO}:%"

    # Also tag base as 'latest'
    docker tag "${DOCKER_HUB_REPO}:base" "${DOCKER_HUB_REPO}:latest"
    docker push "${DOCKER_HUB_REPO}:latest"
fi