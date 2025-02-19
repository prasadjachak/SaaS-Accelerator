using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using System.Threading.Tasks;

namespace Marketplace.SaaS.Accelerator.CustomerSite;

public class CustomOpenIdConnectEvents : OpenIdConnectEvents
{
    public override async Task MessageReceived(MessageReceivedContext context)
    {
        // Set breakpoint in here to see what is happening

        if (!string.IsNullOrEmpty(context.ProtocolMessage.Error) && !string.IsNullOrEmpty(context.ProtocolMessage.ErrorDescription))
        {
            if (context.ProtocolMessage.ErrorDescription.StartsWith("AADB2C90118")) // forgot password
            {
                context.HandleResponse();
                context.Response.Redirect("/Account/ResetPassword");
            }
            else
            {
                context.HandleResponse();
                context.Response.Redirect("/");
            }
        }
        else
        {
            // On successful password reset we need to do this or we get a message.State is null or empty
            context.HandleResponse();
            context.Response.Redirect("/");
        }

        return;// Task.FromResult(0);

    }
}