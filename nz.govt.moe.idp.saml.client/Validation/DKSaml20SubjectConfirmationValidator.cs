using nz.govt.moe.idp.saml.client.Profiles.DKSaml20;
using nz.govt.moe.idp.saml.client.Schema.Core;
using nz.govt.moe.idp.saml.client.Utils;

namespace nz.govt.moe.idp.saml.client.Validation
{
    internal class DKSaml20SubjectConfirmationValidator : ISaml20SubjectConfirmationValidator
    {
        public void ValidateSubjectConfirmation(SubjectConfirmation subjectConfirmation)
        {
            if (subjectConfirmation.Method == SubjectConfirmation.BEARER_METHOD)
            {
                if (subjectConfirmation.SubjectConfirmationData == null)
                    throw new DKSaml20FormatException("The DK-SAML 2.0 Profile requires that the bearer \"SubjectConfirmation\" element contains a \"SubjectConfirmationData\" element.");

                if (!Saml20Utils.ValidateRequiredString(subjectConfirmation.SubjectConfirmationData.Recipient))
                    throw new DKSaml20FormatException("The DK-SAML 2.0 Profile requires that the \"SubjectConfirmationData\" element contains the \"Recipient\" attribute.");

                if (!subjectConfirmation.SubjectConfirmationData.NotOnOrAfter.HasValue)
                    throw new DKSaml20FormatException("The DK-SAML 2.0 Profile requires that the \"SubjectConfirmationData\" element contains the \"NotOnOrAfter\" attribute.");

                if (subjectConfirmation.SubjectConfirmationData.NotBefore.HasValue)
                    throw new DKSaml20FormatException("The DK-SAML 2.0 Profile disallows the use of the \"NotBefore\" attribute of the \"SubjectConfirmationData\" element.");
            }
        }
    }
}