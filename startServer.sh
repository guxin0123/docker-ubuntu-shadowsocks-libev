config='{"server":"0.0.0.0","server_port":'$SS_PORT',"password":"'$SS_PASSWORD'","timeout":60,"method":"'$SS_METHOD'"}' 
echo $config
echo $config > /etc/shadowsocks-libev/myConfig.json

ss-server -c /etc/shadowsocks-libev/myConfig.json
