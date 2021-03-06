# docker-sheepit
A [SheepIt Render Farm](https://www.sheepit-renderfarm.com/) image for Docker. Based on [adoptopenjdk/openjdk11-openj9:alpine-slim](https://hub.docker.com/r/adoptopenjdk/openjdk11-openj9). Uses OpenJ9 and OpenJDK for Java.


## Caveats
- GPU rendering is currently not supported

## Environment Variables:
| Variable      | Description                                                                    | Default |
|---------------|--------------------------------------------------------------------------------|---------|
| user_name     | Your SheepIt Username                                                          |""       |
| user_password | Your SheepIt User Password (recommended to use a key instead of your password) |""       |
| cpu           | Number of CPU cores to use                                                     | all     |

## Command (Docker run)
`docker run -d --name "SheepIt" -e user_name=<your username> -e user_password=<your key> -e cpu=<number of cores> rbxii3/docker-sheepit:latest`
