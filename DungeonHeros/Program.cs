using DungeonHeros.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
/*var connectionString = builder.Configuration.GetConnectionString("DungeonHerosDbContextConnection") ?? throw new InvalidOperationException("Connection string 'DungeonHerosDbContextConnection' not found.");

builder.Services.AddDbContext<DungeonHerosDbContext>(options =>
    options.UseSqlServer(connectionString));;

builder.Services.AddDefaultIdentity<User>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<DungeonHerosDbContext>();;*/

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages().AddRazorRuntimeCompilation();


//builder.Services.AddRazorPages();

builder.Services.AddDbContext<DungeonHerosDbContext>();

builder.Services.AddAuthentication().AddCookie(config => { config.Cookie.Name = "ConnectionCookie"; config.LoginPath = "/home/Connection"; });
//builder.Services.AddAuthentication(options => options.AddPolicy("Admin", policybuilder => policybuilder.RequireClaim(ClaimTypes.Role, "Admin")));

//config password
builder.Services.AddDefaultIdentity<User>(options => 
{ options.Password.RequireDigit = false;
    options.Password.RequireLowercase = false;
    options.Password.RequireNonAlphanumeric = false;
    options.Password.RequireUppercase = false;
    options.Password.RequiredLength = 3;}).AddEntityFrameworkStores<DungeonHerosDbContext>();



var app = builder.Build();



// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");


app.MapRazorPages();

app.Run();
