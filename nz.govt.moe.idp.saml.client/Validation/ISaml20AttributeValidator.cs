using nz.govt.moe.idp.saml.client.Schema.Core;
using nz.govt.moe.idp.saml.client.Schema.Protocol;

namespace nz.govt.moe.idp.saml.client.Validation
{
    internal interface ISaml20AttributeValidator
    {
        void ValidateAttribute(SamlAttribute samlAttribute);
        void ValidateEncryptedAttribute(EncryptedElement encryptedElement);
    }
}