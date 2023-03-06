# Skripte

Scaffold-DbContext "{string}" Microsoft.EntityFrameworkCore.SqlServer -OutputDir MojaBaza


builder.Services.AddDbContext<GradoviContext>(options =>
    options.UseSqlServer("Data Source=DESKTOP-2GP0R2M;Initial Catalog=Gradovi;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"));
    
    
    endpoint za vjezbe
    https://expertvjezbeapi.azurewebsites.net/swagger/index.html



yaml for publish
    
`code`
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
    
`code`
    
    Publish to github pages
- 1 create project
- 2 create github repository
- 3 publish code to main branch
- 4 switch to actions
- 5 Skip this and set up a workflow yourself 
- 6 copy paste yaml definition
 run: dotnet publish replace with your csproj file
- 7. save and commit
- 8. check if workflow is set in actions
- 9 go to actions->genaral and enable read write permissions

- 10 switch to gh-pages branch abd go to pages
- 11 select deploy from a branch
- 12 select gh-pages and save
- 13 go to your github domain address {username}.github.io/{reponame}
- 14. setup url paths in index.html to absolute to your domain url address
