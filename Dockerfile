FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /

# Copy csproj and restore as distinct layers
COPY *.sln ./
COPY DemoBank.Transaction.Api/*.* DemoBank.Transaction.Api/
COPY DemoBank.Transaction.Domain/DemoBank.Transaction.Domain.csproj DemoBank.Transaction.Domain/
COPY DemoBank.Transaction.Infrastructure.Data/DemoBank.Transaction.Infrastructure.Data.csproj DemoBank.Transaction.Infrastructure.Data/
COPY DemoBank.Transaction.Infrastructure.Communication/DemoBank.Transaction.Infrastructure.Communication.csproj DemoBank.Transaction.Infrastructure.Communicatio/
COPY DemoBank.Transaction.CrossCutting/DemoBank.Transaction.CrossCutting.csproj DemoBank.Transaction.CrossCutting/
COPY DemoBank.Transaction.Test/DemoBank.Transaction.Test.csproj DemoBank.Transaction.Test/
COPY . ./
RUN dotnet restore

# Copy everything else and build
WORKDIR /DemoBank.Transaction.Api
RUN dotnet publish -c Release -o /app

# Build runtime image
FROM microsoft/dotnet:2.2-aspnetcore-runtime

WORKDIR /app
COPY --from=build-env /app .
ENTRYPOINT ["dotnet", "DemoBank.Transaction.Api.dll"]

EXPOSE 80