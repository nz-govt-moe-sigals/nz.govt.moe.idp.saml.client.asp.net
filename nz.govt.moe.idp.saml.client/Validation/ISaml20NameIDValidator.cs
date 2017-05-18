using nz.govt.moe.idp.saml.client.Schema.Core;
using nz.govt.moe.idp.saml.client.Schema.Protocol;

namespace nz.govt.moe.idp.saml.client.Validation
{
    internal interface ISaml20NameIDValidator
    {
        void ValidateNameID(NameID nameID);
        void ValidateEncryptedID(EncryptedElement encryptedID);
    }
}