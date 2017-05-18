using System;
using nz.govt.moe.idp.saml.client.Profiles.DKSaml20;
using nz.govt.moe.idp.saml.client.Schema.Core;
using nz.govt.moe.idp.saml.client.Schema.Protocol;
using nz.govt.moe.idp.saml.client.MOE;

namespace nz.govt.moe.idp.saml.client.Validation
{
    [CustomModificationsAttribute]
    internal class DKSaml20AttributeValidator : ISaml20AttributeValidator
    {
        public void ValidateAttribute(SamlAttribute samlAttribute)
        {            
            // MOE: REMOVE CHECK AS ESAA DOES NOT RETURN COMPLIANT MESSAGE:
            //if (!Uri.IsWellFormedUriString(samlAttribute.Name, UriKind.Absolute))
            //    throw new DKSaml20FormatException("The DK-SAML 2.0 profile requires that an attribute's \"Name\" is an URI.");

            if (samlAttribute.AttributeValue == null)
                return;

            foreach (object val in samlAttribute.AttributeValue)
            {
                if (val is string)
                    continue;

                throw new DKSaml20FormatException("The DK-SAML 2.0 profile requires that all attribute values are of type \"xs:string\".");
            }
        }

        public void ValidateEncryptedAttribute(EncryptedElement encryptedElement)
        {
            throw new DKSaml20FormatException("The DK-SAML 2.0 profile does not support the EncryptedAttribute element");
        }
    }
}