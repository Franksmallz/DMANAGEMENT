FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY DispatchMgt/*.csproj ./DispatchMgt/
RUN dotnet restore

# copy everything else and build app
COPY DispatchMgt/. ./DispatchMgt/
WORKDIR /app/DispatchMgt
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=build /app/DispatchMgt/out ./
ENTRYPOINT ["dotnet", "DispatchMgt.dll"]