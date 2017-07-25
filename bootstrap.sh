su - root
export DP_Id="your_dnspod_api_id"
export DP_Key="your_dnspod_api_key"

# 以 root 权限执行以下命令
curl https://get.acme.sh | sh
source ~/.bashrc
acme.sh --upgrade --auto-upgrade

# 注册普通证书和 ECC 证书
acme.sh --issue --dns dns_dp -d laozhu.me -d www.laozhu.me -d status.laozhu.me -d labs.laozhu.me
acme.sh --issue --dns dns_dp -d laozhu.me -d www.laozhu.me -d status.laozhu.me -d labs.laozhu.me -k ec-384

# 安装 RSA 证书
acme.sh --install-cert -d laozhu.me \
    --ca-file /etc/nginx/ssl/laozhu.me/ca.cer \
    --cert-file /etc/nginx/ssl/laozhu.me/laozhu.me.cer \
    --key-file /etc/nginx/ssl/laozhu.me/laozhu.me.key \
    --fullchain-file /etc/nginx/ssl/laozhu.me/fullchain.cer \
    --reloadcmd "service nginx force-reload"

# 安装 ECC 证书
acme.sh --ecc --install-cert -d laozhu.me \
    --ca-file /etc/nginx/ssl/laozhu.me_ecc/ca.cer \
    --cert-file /etc/nginx/ssl/laozhu.me_ecc/laozhu.me.cer \
    --key-file /etc/nginx/ssl/laozhu.me_ecc/laozhu.me.key \
    --fullchain-file /etc/nginx/ssl/laozhu.me_ecc/fullchain.cer \
    --reloadcmd "service nginx force-reload"

# 从 <https://letsencrypt.org/certificates/> 下载最新的中间证书
# Primary: https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt
# Backup: https://letsencrypt.org/certs/lets-encrypt-x4-cross-signed.pem.txt

# 检查 Let’s Encrypt 中间证书有效性
openssl x509 -in lets-encrypt-x3-cross-signed.pem -noout -subject
openssl x509 -in lets-encrypt-x4-cross-signed.pem -noout -subject

# HPKP Primary
openssl x509 -in lets-encrypt-x3-cross-signed.pem -noout -pubkey | openssl asn1parse -noout -inform pem -out public.key
openssl dgst -sha256 -binary public.key | openssl enc -base64

# HPKP Backup
openssl x509 -in lets-encrypt-x4-cross-signed.pem -noout -pubkey | openssl asn1parse -noout -inform pem -out public.key
openssl dgst -sha256 -binary public.key | openssl enc -base64