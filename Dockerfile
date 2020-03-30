FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.csproj .
RUN dotnet restore

# copy and publish app and libraries
COPY . .
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/core/sdk:3.1
WORKDIR /app
COPY --from=build /app .
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /app/entrypoint.sh
# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/app/entrypoint.sh"]


# FROM docker.pkg.github.com/marcuslindblom/application-insights-alerts/application-insights-alerts:v1

# ENTRYPOINT ["/app/entrypoint.sh"]