using System;
using System.Collections.Generic;

namespace nz.govt.moe.idp.saml.client.session.inproc
{
    class InProcSession : ISession
    {
        private static readonly IDictionary<string, object> _dictionary =  new Dictionary<string, object>();

        public InProcSession(Guid sessionId)
        {
            Id = sessionId;
        }

        public object this[string key]
        {
            get
            {
                if (_dictionary.ContainsKey(key))
                {
                    return _dictionary[key];
                }
                return null;
            }
            set { _dictionary[key] = value; }
        }

        public void Remove(string key)
        {
            _dictionary.Remove(key);
        }

        public bool New { get; set; }

        public Guid Id { get; private set; }
    }
}
