using System.Collections.Generic;
using System.Security.Principal;
using nz.govt.moe.idp.saml.client.Session;
using nz.govt.moe.idp.saml.client.session;
using nz.govt.moe.idp.saml.client.identity;

namespace nz.govt.moe.idp.saml.client.Identity
{
    /// <summary>
    /// 
    /// </summary>
    internal class Saml20PrincipalCache
    {
        /// <summary>
        /// Gets the principal.
        /// </summary>
        /// <returns></returns>
        internal static IPrincipal GetPrincipal()
        {
            var saml20Assertion = GetSaml20AssertionLite();
            if (saml20Assertion != null)
                return Saml20Identity.InitSaml20Identity(saml20Assertion);
            return null;
        }

        /// <summary>
        /// Gets the principal.
        /// </summary>
        /// <returns></returns>
        internal static Saml20AssertionLite GetSaml20AssertionLite()
        {
            ISession session = SessionFactory.SessionContext.Current;

            if (session != null)
            {
                return session[SessionConstants.Saml20AssertionLite] as Saml20AssertionLite;
            }
            return null;
        }
    }
}
