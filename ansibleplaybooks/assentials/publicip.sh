hostid=$(curl ifconfig.co)
export hostid
sed -i "s/localhost/$hostid/g" /root/assentials/apihtml.html
