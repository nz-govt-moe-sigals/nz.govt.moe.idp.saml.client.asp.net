using System;
using nz.govt.moe.idp.saml.client.Schema.Core;

namespace nz.govt.moe.idp.saml.client.Validation
{
    internal interface ISaml20AssertionValidator
    {
        void ValidateAssertion(Assertion assertion);
        void ValidateTimeRestrictions(Assertion assertion, TimeSpan allowedClockSkew);
    }
}