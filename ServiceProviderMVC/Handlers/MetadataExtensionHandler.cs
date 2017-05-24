using nz.govt.moe.idp.saml.client.config;
using System;
using System.IO;
using System.Web;

namespace ServiceProviderMVC.Handlers
{
    public class MetadataExtensionHandler : IHttpHandler
    {
        /// <summary>
        /// You will need to configure this handler in the Web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: https://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/xml";
            context.Response.AddHeader("Content-Disposition", "attachment; filename=\"metadata-extension.xml\"");

            GenerateMetadataExtensionDocument(context);
        }

        private void GenerateMetadataExtensionDocument(HttpContext context)
        {
            SAML20FederationConfig configuration = SAML20FederationConfig.GetConfig();

            string sdID = configuration.ServiceProvider.ID;

            string xmlTemplatePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Metadata/Templates/metadata.extended.template.xml");


            string fileContents = File.ReadAllText(xmlTemplatePath).Replace("[[SP.ID]]", sdID);

            context.Response.Write(fileContents); //, doc.ToXml(context.Response.ContentEncoding)
        }
        #endregion
    }
}