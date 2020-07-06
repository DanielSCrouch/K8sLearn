{

cat > admin-csr.json <<EOF
{
  "CN": "admin",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "UK",
      "L": "London",
      "O": "system:masters",
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
  admin-csr.json | cfssljson -bare admin

}
