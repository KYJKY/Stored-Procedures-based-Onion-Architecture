using Microsoft.AspNetCore.HttpOverrides;
using Repository;
using Server.Extension;

string corsPolicyName = "CORS_POLICY_NAME";

var builder = WebApplication.CreateBuilder(args);
{
    builder.Services.ConfigureCors(corsPolicyName);     
    builder.Services.ConfigureRepositoryManager();      // Repository Layer
    //builder.Services.ConfigureServiceManager();                
    builder.Services.AddSingleton<DapperContext>();     // Dapper Context

    builder.Services.ConfigureSevices();

    // Swagger/OpenAPI
    builder.Services.AddEndpointsApiExplorer();
    builder.Services.AddSwaggerGen();
}

var app = builder.Build();
{
    app.UseDefaultFiles();
    app.UseStaticFiles();
    app.UseForwardedHeaders(new ForwardedHeadersOptions
    {
        ForwardedHeaders = ForwardedHeaders.All
    });

    if (app.Environment.IsDevelopment())
    {
        app.UseSwagger();
        app.UseSwaggerUI();
    }

    if (app.Environment.IsProduction())
    {
        app.UseHsts();
    }

    app.MapControllers();
    app.UseCors(corsPolicyName);

    app.Run();
}
