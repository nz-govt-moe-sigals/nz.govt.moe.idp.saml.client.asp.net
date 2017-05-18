using nz.govt.moe.idp.saml.client.Schema.Core;

namespace nz.govt.moe.idp.saml.client.Validation
{
    internal interface ISaml20StatementValidator
    {
        void ValidateStatement(StatementAbstract statement);
    }
}