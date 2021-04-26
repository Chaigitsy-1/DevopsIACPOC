hostid=$(curl ifconfig.co)
export hostid
sed -i "s/localhost/$hostid/g" apihtml.html
