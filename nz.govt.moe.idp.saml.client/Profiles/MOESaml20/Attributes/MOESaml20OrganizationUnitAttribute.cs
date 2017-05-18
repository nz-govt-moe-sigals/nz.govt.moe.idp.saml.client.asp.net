using nz.govt.moe.idp.saml.client.Schema.Core;

namespace nz.govt.moe.idp.saml.client.Profiles.DKSaml20.Attributes
{
    /// <summary>
    /// 
    /// </summary>
    public class DKSaml20OrganizationUnitAttribute : DKSaml20Attribute
    {
        /// <summary>
        /// Attribute name
        /// </summary>
        public const string NAME = "urn:oid:2.5.4.11";
        /// <summary>
        /// Friendly name
        /// </summary>
        public const string FRIENDLYNAME = "organizationUnit";

        /// <summary>
        /// Creates an attribute with the specified value.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        public static SamlAttribute Create(string value)
        {
            return Create(NAME, FRIENDLYNAME, value);
        }
    }
}