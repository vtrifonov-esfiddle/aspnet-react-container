# RepoRootPath=/host_mnt/c/GithubRepos/aspnet-react-container
RepoRootPath=$PWD
docker run \
    --volume "$RepoRootPath/unitTests:/unitTests:cached" \
    --volume "aspnet-unit-tests-bin:/unitTests/bin" \
    --volume "aspnet-unit-tests-obj:/unitTests/obj" \
    --volume "$RepoRootPath/testResults:/testResults" \
    --workdir /unitTests \
    --name dotnet-unit-tests \
    --rm \
    mcr.microsoft.com/dotnet/core/sdk:3.1 bash \
    -c "dotnet restore && dotnet test UnitTests.csproj --logger:\"xunit;LogFilePath=/testResults/dotnetUnitTests.xml\""
