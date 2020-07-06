{

cat > service-account-csr.json <<EOF
{
  "CN": "service-accounts",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "UK",
      "L": "London",
      "O": "Kubernetes",
      "OU": "Kubernetes The Hard Way"
    }
  ]
}
EOF

cfssl gencert \
  -ca=../cert_authority/ca.pem \
  -ca-key=../cert_authority/ca-key.pem \
  -config=../cert_authority/ca-config.json \
  -profile=kubernetes \
  service-account-csr.json | cfssljson -bare service-account

}
