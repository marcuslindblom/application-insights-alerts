# Container image that runs your code
FROM docker.pkg.github.com/marcuslindblom/application-insights-alerts/application-insights-alerts:v17

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]