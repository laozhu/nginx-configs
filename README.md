# Nginx Configs <img src="https://upload.wikimedia.org/wikipedia/commons/c/c5/Nginx_logo.svg" alt="Nginx" width="120" height="42" align="right">

_My personal server's nginx configs, optimized for HTTPS and HTTP2_

## Install

```bash
sudo apt install nginx
sudo apt install certbot python-certbot-nginx
sudo certbot --nginx certonly
```

Then copy nginx configs to your server's `/etc/nginx` folder

```bash
ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf
```

Change the `server_name: example.com` and `root /home/ritchie/www/example.com` of server to yours.

## Test

```bash
sudo nginx -t
sudo nginx reload
```

Test and change your configs until it's OK ✅.

## Renew

If certificate is getting expired in next 30 days, certbot will renew certificates automatically.

## Credits

- [Let’s Encrypt](https://letsencrypt.org/)
- [Certbot](https://certbot.eff.org/)
- [server-configs-nginx](https://github.com/h5bp/server-configs-nginx)
- [SSL Server Test](https://www.ssllabs.com/ssltest/)
- [HTTP Security Report](https://httpsecurityreport.com)
- [Mozilla SSL Configuration Generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/)
- [CSP Evaluator](https://csp-evaluator.withgoogle.com/)
- [CSP Generator](https://report-uri.com/home/generate/)
- [内容安全策略](https://developers.google.com/web/fundamentals/security/csp/?hl=zh-cn)