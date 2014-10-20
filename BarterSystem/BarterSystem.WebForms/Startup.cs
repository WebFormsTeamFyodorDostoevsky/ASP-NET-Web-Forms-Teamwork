using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BarterSystem.WebForms.Startup))]
namespace BarterSystem.WebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
