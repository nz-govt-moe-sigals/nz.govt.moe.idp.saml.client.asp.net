using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ServiceProviderMVC.Startup))]
namespace ServiceProviderMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
