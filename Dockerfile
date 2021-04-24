FROM mcr.microsoft.com/dotnet/core/sdk:3.0 as server

ENV ASPNETCORE_Environment=Production

WORKDIR /server

COPY . ./

RUN dotnet publish -c Release -o publish

CMD ["dotnet","publish/Project.dll"]