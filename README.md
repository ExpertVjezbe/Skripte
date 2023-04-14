
Endpoint za vjezbe G3
https://expertshopapi.azurewebsites.net/swagger/index.html


# Skripte

Scaffold-DbContext "{string}" Microsoft.EntityFrameworkCore.SqlServer -OutputDir MojaBaza


builder.Services.AddDbContext<GradoviContext>(options =>
    options.UseSqlServer("Data Source=DESKTOP-2GP0R2M;Initial Catalog=Gradovi;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"));
    
    
    endpoint za vjezbe
    https://expertvjezbeapi.azurewebsites.net/swagger/index.html



yaml for publish
    
```
    
    
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
      run: dotnet publish WebSaApiem/WebSaApiem.csproj -c Release -o release --nologo
     # changes the base-tag in index.html from '/' to 'prvi-web' to match GitHub Pages repository subdirectory
    - name: Change base-tag in index.html from / to prvi-web
      run: sed -i 's/<base href="\/" \/>/<base href="\/prvi-web\/" \/>/g' release/wwwroot/index.html

    # changes the base-tag in index.html from '/' to 'prvi-web' to match GitHub Pages repository subdirectory
    - name: Fix service-worker-assets.js hashes
      working-directory: release/wwwroot
      run: |
        jsFile=$(<service-worker-assets.js)
        # remove JavaScript from contents so it can be interpreted as JSON
        json=$(echo "$jsFile" | sed "s/self.assetsManifest = //g" | sed "s/;//g")
        # grab the assets JSON array
        assets=$(echo "$json" | jq '.assets[]' -c)
        for asset in $assets
        do
          oldHash=$(echo "$asset" | jq '.hash')
          #remove leading and trailing quotes
          oldHash="${oldHash:1:-1}"
          path=$(echo "$asset" | jq '.url')
          #remove leading and trailing quotes
          path="${path:1:-1}"
          newHash="sha256-$(openssl dgst -sha256 -binary $path | openssl base64 -A)"
          
          if [ $oldHash != $newHash ]; then
            # escape slashes for json
            oldHash=$(echo "$oldHash" | sed 's;/;\\/;g')
            newHash=$(echo "$newHash" | sed 's;/;\\/;g')
            echo "Updating hash for $path from $oldHash to $newHash"
            # escape slashes second time for sed
            oldHash=$(echo "$oldHash" | sed 's;/;\\/;g')
            jsFile=$(echo -n "$jsFile" | sed "s;$oldHash;$newHash;g")
          fi
        done

        echo -n "$jsFile" > service-worker-assets.js
    # copy index.html to 404.html to serve the same file when a file is not found
    - name: copy index.html to 404.html
      run: cp release/wwwroot/index.html release/wwwroot/404.html

    # add .nojekyll file to tell GitHub pages to not treat this as a Jekyll project. (Allow files and folders starting with an underscore)
    - name: Add .nojekyll file
      run: touch release/wwwroot/.nojekyll
      
    - name: Commit wwwroot to GitHub Pages
      uses: JamesIves/github-pages-deploy-action@3.7.1
      with:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        BRANCH: gh-pages
        FOLDER: release/wwwroot
    

    
```
    
    Publish to github pages
- 1 create project
- 2 create github repository
- 3 publish code to main branch
- 4 switch to actions
- 5 Skip this and set up a workflow yourself 
- 6 copy paste yaml definition
 run: dotnet publish replace with your csproj file
- 7 save and commit
- 8 check if workflow is set in actions
- 9 go to actions->genaral and enable read write permissions

- 10 switch to gh-pages branch abd go to pages
- 11 select deploy from a branch
- 12 select gh-pages and save
- 13 go to your github domain address {username}.github.io/{reponame}
- 14 setup url paths in index.html to absolute to your domain url address
