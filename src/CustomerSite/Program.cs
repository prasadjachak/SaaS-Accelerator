using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Serilog;

namespace Marketplace.SaaS.Accelerator.CustomerSite;

/// <summary>
/// Program.
/// </summary>
public class Program
{
    /// <summary>
    /// Defines the entry point of the application.
    /// </summary>
    /// <param name="args">The arguments.</param>
    public static void Main(string[] args)
    {
        CreateHostBuilder(args).Build().Run();
        var loggerFactory = LoggerFactory.Create(builder =>
        {
            builder.AddSerilog();
        });

        Microsoft.Extensions.Logging.ILogger logger = loggerFactory.CreateLogger<Program>();
        logger.LogInformation("Service Provisioning initialized!!");
    }

    /// <summary>
    /// Creates the host builder.
    /// </summary>
    /// <param name="args">The arguments.</param>
    /// <returns> Host Builder.</returns>
    public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureLogging(logging =>
            {
                logging.AddSerilog();
            })
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.UseUrls("https://*:5001", "http://*:5000");
                webBuilder.UseStartup<Startup>();
            })
        .UseSerilog((ctx, logConfig) => logConfig.ReadFrom.Configuration(ctx.Configuration));
}