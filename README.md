# Skripte

Scaffold-DbContext "Server=.;Database=BookStore;Trusted_Connection=True;" 
Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models


builder.Services.AddDbContext<GradoviContext>(options =>
    options.UseSqlServer("Data Source=DESKTOP-2GP0R2M;Initial Catalog=Gradovi;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"));
