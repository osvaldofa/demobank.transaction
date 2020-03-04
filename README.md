# demobank.transaction
DemoBank API for Transaction Services.

About this application
------------------------------------------------

This artifact is a microservice implemented using Microsoft .NET Core 2.2 platform, ready to be deployed on containers.

It deliveries the Account operations available on DemoBank API.


How to Get the code?
------------------------------------------------

The code is managed by Git repositories, so shall be needed to "clone" the repo:
git clone https://github.com/osvaldofa/demobank.transaction

How to Run my app?
------------------------------------------------

Once downloaded the files, using any command line application (recommendation: Windows PowerShell),
inside the solution folder (same folder of .sln file) use the following commands:
- docker build -t demobank-account .
- docker run -p 5000:80 demobank-account:latest
- Access the Account API root URL through: http://localhost:5000/api/v1/transaction

If you don't have installed all the requirements, the link below may support you:
https://docs.docker.com/install/

If you prefer run it locally may be used the IDE Visual Studio 2019, or even the command below:
- dotnet run (inside the folder "DemoBank.Account.Api")

How to run Tests?
------------------------------------------------

Inside solution folder, type the command below:
- dotnet test

In case of througles, the link may help:
https://docs.microsoft.com/pt-br/dotnet/core/tools/dotnet-test
