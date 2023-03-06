# Skripte

Scaffold-DbContext "{string}" Microsoft.EntityFrameworkCore.SqlServer -OutputDir MojaBaza


builder.Services.AddDbContext<GradoviContext>(options =>
    options.UseSqlServer("Data Source=DESKTOP-2GP0R2M;Initial Catalog=Gradovi;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"));
    
    
    endpoint za vjezbe
    https://expertvjezbeapi.azurewebsites.net/swagger/index.html



yaml for publish

name: github pages learning

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  deploy-to-github-pages:
  # use ubuntu-latest image to run steps on
    runs-on: ubuntu-latest
    steps:
    # uses GitHub's checkout action to checkout code form the main branch
    - uses: actions/checkout@v2
     # sets up .NET Core SDK 6.0.x
    - name: Setup .NET Core SDK
      uses: actions/setup-dotnet@v3.0.3
      with:
        dotnet-version: 7.0
    # Install dotnet wasm buildtools workload
    - name: Install .NET WASM Build Tools
      run: dotnet workload install wasm-tools
    # Publishes Blazor project to the release-folder

    - name: Publish .NET Core Project
      run: dotnet publish pagecycle/pagecycle.csproj -c:Release -p:GHPages=true -o dist/Web --nologo
    - name: Commit wwwroot to GitHub Pages
      uses: JamesIves/github-pages-deploy-action@3.7.1
      with:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        BRANCH: gh-pages
        FOLDER: dist/Web/wwwroot
