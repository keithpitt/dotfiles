## Add port forward file (add 5000 to .port file)
```
cd /path/to/newco_app
vi .port
bundle exec foreman start
```
## Install POW
```
curl get.pow.cx | sh
cd ~/.pow
ln -s /path/to/newco_app/.port jqdev
```
##Update Brew & install Nginx
```
brew update
brew install nginx
```
#### You should have v1.2.2 installed, any other version (lower) can have strange issues

## Alter Nginx install
### Apply nginx.conf and gen_cert.rb as listed below
```
cd /usr/local/etc/nginx
vi nginx.conf
mkdir ssl
cd ssl
vi gen_cert.rb
ruby gen_cert.rb jqdev.dev
sudo nginx
open https://hooroo.jqdev.dev
```

## Mark certificate as secure locally (Chrome)
* When viewing https://hooroo.jqdev.dev
* Click the crossed padlock icon top left
* Click 'certificate information'
* Drag the large certificate icon to your desktop
* Double click and add to keychain
* Right click and choose 'get info' on the '*.jqdev.dev'
* Change 'When using this certificate' to 'Always trust'
* Refresh in Chrome