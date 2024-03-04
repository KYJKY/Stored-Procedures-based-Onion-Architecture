namespace Server.Extension
{
    public static class ServiceExtension
    {
        public static void ConfigureCors(this IServiceCollection services, string corsPolicyName) =>
        services.AddCors(options =>
        {
            // 현재는 모든 도메인을 CORS 정책으로부터 허용함
            options.AddPolicy(corsPolicyName, builder =>
            builder.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader());

            // 특정 도메인만 허용하도록 수정
            //options.AddPolicy(corsPolicyName, builder =>
            //builder.WithOrigins("https://example.com")      // 입력한 도메인만 접근 가능
            //.WithMethods("POST", "GET")                     // POST, GET 방식만 접근 가능
            //.WithHeaders("accept", "content-type"));        // 특정 헤더만 허용
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
