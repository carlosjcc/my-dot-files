# LOCAL CALLS

# headers
# x_ftv_capabilities="stb-GEN2,99.99,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments,hlsonly,4K,HEVC,ac3,hayu"
x_ftv_capabilities="stb-GEN3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3"
x_ftv_capabilities="stb-GEN3,99.99,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments,hlsonly,4K,ac3"
# akhila's
# x_ftv_capabilities="99.99,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments,hlsonly,4K,HEVC,ac3, stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments"

# user_agent="Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)"
# user_agent="FetchTv AppleWebKit"
user_agent="FetchTv AppleWebKit M605T"


# authentication

# hosuehold
# isp_customer_ref: 'MW Carlos Home'
# uuid: 7d733fdd-8613-4a40-b71e-f1eeb42d2561
# id: 3886824
#
# Terminal.objects.get(mac_address='0C:56:5C:6D:D2:74').household_id

# mighty
# serial number: 971725107197300
# l_mac_address="0C:56:5C:6D:D2:74"
# l_token="m2fyr7g2e2"

# telstra
# serial number: 971714107040993
# l_mac_address="0C:56:5C:6B:6F:E1"
# l_token="7x6ye7eued"

# retail
# l_mac_address="0C:56:5C:8D:85:F9"
# l_token="sr6pr5bzfk"

# mini
# serial number: 272040009705606
l_mac_address="0C:56:5C:94:18:86"
l_token="mdcqqa8he3"


# karen
# l_mac_address="0C:56:5C:5A:ED:D4"
# l_token="kn7dyb7rt5"

# akhila
# l_mac_address="0C:56:5C:9A:14:83"
# l_token="skcfmtnqwc"

# mw-5796
# hh id: 4318884
# l_mac_address="0C:56:5C:9C:71:C1"
# l_token="awyy2pckte"

# jo
# l_mac_address="0C:56:5C:9A:03:58"
# l_token="jo2"

# no movie box
# l_mac_address="0C:56:5C:9A:16:4E"
# l_token="gc9ym3837e"

# movie box
# l_mac_address="0C:56:5C:9A:1F:AE"
# l_token="sa84bdqzuf"

# mw-5718
# l_mac_address="0C:56:5C:9A:09:6D"
# l_token="kqxh34eudn"

# l_mac_address="0C:56:5C:9C:6D:C5"
# l_token="u42c4afyc6"

# kyle
l_mac_address="0C:56:5C:92:4E:7B"
l_token="cbtsvs9b2q"


# Ryan
# serial number: 272040009705606
# l_mac_address="0C:56:5C:6B:48:41"
# l_token="ww3fzb9rkx"

curl_lauth_opts=(
    -c "$cookies_folder"lcookies.txt 
    -H "User-Agent: $user_agent" 
    -H "X-FTV-Capabilties: $x_ftv_capabilities" 
    -H "X-FTV-ClientState: sbs,nine,paramount,ten,stan,netflix,amazon,disney_plus,sbs,britbox"
    --data "auth_id=$l_mac_address&auth_token=$l_token" 
)

mwauthlocal () {
    curl "${curl_lauth_opts[@]}" 127.0.0.1:12121/v2/authenticate | python -m json.tool | less
}

# endpoint calls
curl_lopts=(
    -b "$cookies_folder"lcookies.txt 
    -H "User-Agent: $user_agent" 
    -H "X-FTV-Capabilties: $x_ftv_capabilities"
    -H "X-FTV-ClientState: sbs,nine,paramount,ten,stan,netflix,amazon,disney_plus,sbs,britbox"
    # -H "X-FTV-ClientState: sbs,nine,paramount,ten,stan,netflix,amazon,disney_plus,sbs,britbox"
)

# get call
mwlocal() {
    # hit the local mw with the endpoint as parameter $1
    curl "${curl_lopts[@]}" 127.0.0.1:12121$1
}
#  | python -m json.tool | less

# post call
mwpostlocal() {
    # hit the local mw with the endpoint as parameter $1
    curl --data "$1" "${curl_lopts[@]}" 127.0.0.1:12121$2 | python -m json.tool | less
}

####################
###### mobile ######
####################
#
x_ftv_capabilities_mobile="ios,v3.300.300,no_pin,tenplay_v2,ui3,mobile3.30"
user_agent_mobile=""

curl_lauth_mobile_opts=(
    -c "$cookies_folder"local_mobile_cookies.txt 
    -H "User-Agent: $user_agent_mobile" 
    -H "X-FTV-Capabilties: $x_ftv_capabilities_mobile" 
    -H "X-FTV-ClientState: sbs,nine,paramount,ten,stan,netflix,amazon,disney_plus,sbs,britbox"
    --data "auth_id=$l_mac_address&auth_token=$l_token" 
)

# endpoint calls
curl_l_mobile_opts=(
    -b "$cookies_folder"local_mobile_cookies.txt 
    -H "User-Agent: $user_agent_mobile" 
    -H "X-FTV-Capabilties: $x_ftv_capabilities_mobile"
)

mwauthmobilelocal(){
    curl "${curl_lauth_mobile_opts[@]}" "127.0.0.1:12121/v3/authenticate?activation_code=$l_token&pin=0000" | python -m json.tool | less
}

# get call
mwmobilelocal() {
    # hit the local mw with the endpoint as parameter $1
    curl "${curl_l_mobile_opts[@]}" 127.0.0.1:12121$1 | python -m json.tool | less
}

# post call
mwpostmobilelocal() {
    # hit the local mw with the endpoint as parameter $1
    curl --data "$1" "${curl_l_mobile_opts[@]}" 127.0.0.1:12121$2 | python -m json.tool | less
}
