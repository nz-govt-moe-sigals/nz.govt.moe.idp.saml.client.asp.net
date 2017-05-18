using nz.govt.moe.idp.saml.client.Schema.Core;

namespace nz.govt.moe.idp.saml.client.Validation
{
    interface ISaml20SubjectValidator
    {
        void ValidateSubject(Subject subject);
    }
}