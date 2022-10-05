FROM mcr.microsoft.com/dotnet/sdk:latest@sha256:2fdad630a59fbdecbfcc6aaf3ccae96eea0e8d24cd4607669fde0de107a94c53 as build
COPY . ./src
WORKDIR /src
RUN dotnet build -o /app
RUN dotnet publish -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:latest@sha256:99d7ef1ce989ace31dfef826a3e702606f19774665acd1d00cd3d29f3e6e3149 as base
COPY --from=build  /publish /app
WORKDIR /app
EXPOSE 80
CMD ["./myWebApp"]