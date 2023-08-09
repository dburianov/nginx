geoip_country /usr/local/nginx/geoip/GeoIP.dat;
geoip_city    /usr/local/nginx/geoip/GeoLiteCity.dat;
geoip_org     /usr/local/nginx/geoip/GeoIPASNum.dat;

map $geoip_country_code $allowed_country {
    default yes;
    RU      no;
}

geo $blacklist {
    default         0;
    172.16.0.0/24   1;
}

# GeoIP Block
#if ($allowed_country = no) {
##    add_header X-301 badcountry;
#    return 489;
#}
# Drop method
#if ( $request_method !~ ^(GET|HEAD)$ ) {                                  
##    add_header X-301 badmethod;
#    return 490;
#}

#if ($blacklist) {
#    return 484;
#}
