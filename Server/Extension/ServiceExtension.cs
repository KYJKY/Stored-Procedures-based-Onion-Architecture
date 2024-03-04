namespace Server.Extension
{
    public static class ServiceExtension
    {
        public static void ConfigureCors(this IServiceCollection services, string corsPolicyName) =>
        services.AddCors(options =>
        {
            // Currently all domains are allowed from CORS policy
            options.AddPolicy(corsPolicyName, builder =>
            builder.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader());

            // Allow only specific domains
            //options.AddPolicy(corsPolicyName, builder =>
            //builder.WithOrigins("https://example.com")
            //.WithMethods("POST", "GET")              
            //.WithHeaders("accept", "content-type")); 
        });

        //public static void ConfigureRepositoryManager(this IServiceCollection services) =>
        //services.AddScoped<IRepositoryManager, RepositoryManager>();
        //
        //public static void ConfigureServiceManager(this IServiceCollection services) =>
        //services.AddScoped<IServiceManager, ServiceManager>();

        public static void ConfigureSevices(this IServiceCollection services)
        {
            services.AddControllers()
                    .AddApplicationPart(typeof(Presentation.AssemblyReference).Assembly)
                    .AddJsonOptions(options =>
                    {
                        options.JsonSerializerOptions.PropertyNamingPolicy = null;
                    });
        }
    }
}
