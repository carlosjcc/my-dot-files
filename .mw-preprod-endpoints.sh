# PREPRODUCTION CALLS

# headers
# x_ftv_capabilities_pp="stb-GEN2,99.99,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments,hlsonly,4K,HEVC,ac3,hayu"
x_ftv_capabilities_pp="stb-GEN3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3"
# akhila's
x_ftv_capabilities_pp="ui3.30,99.99,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments,hlsonly,4K,HEVC,ac3"
user_agent_pp="Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)"
user_agent_pp="FetchTv AppleWebKit"
user_agent_pp="FetchTv AppleWebKit M605T"

# mighty
pp_mac_address="0C:56:5C:6D:D2:74"
pp_token="m2fyr7g2e2"


# mini
# serial number: 272040009705606
# pp_mac_address="0C:56:5C:94:18:86"
# pp_token="mdcqqa8he3"


# karen
# pp_mac_address="0C:56:5C:5A:ED:D4"
# pp_token="kn7dyb7rt5"

# pp_mac_address="0C:56:5C:98:42:E1"
# pp_token="tskx7d3xvd"


# mw 5493
# pp_mac_address="0C:56:5C:81:21:5F"
# pp_token="5umqvfgmsg"


# akhila
# pp_mac_address="0C:56:5C:9A:14:83"
# pp_token="skcfmtnqwc"

# retail
# pp_mac_address="0C:56:5C:9E:90:9C"
# pp_token="4tcddskye6"

# jo's
# pp_mac_address="0C:56:5C:9A:03:58"
# pp_token="jo2"

# movie box
# pp_mac_address="0C:56:5C:9A:1F:AE"
# pp_token="sa84bdqzuf"

# no movie box
# pp_mac_address="0C:56:5C:9A:16:4E"
# pp_token="gc9ym3837e"

curl_ppauth_opts=(
    -c "$cookies_folder"ppcookies.txt 
    -H "User-Agent: $user_agent_pp" 
    -H "X-FTV-Capabilties: $x_ftv_capabilities_pp" 
    --data "auth_id=$pp_mac_address&auth_token=$pp_token" 
)

mwauthpp() {
    curl "${curl_ppauth_opts[@]}" preproduction.i.fetchtv.com.au:12121/v2/authenticate | python -m json.tool | less
}

# endpoint calls
curl_ppopts=(
    -b "$cookies_folder"ppcookies.txt 
    -H "User-Agent: $user_agent_pp" 
    -H "X-FTV-Capabilties: $x_ftv_capabilities_pp" 
)

# get call
mwpp() {
    # hit the local mw with the endpoint as parameter $1
    curl "${curl_ppopts[@]}" "preproduction.i.fetchtv.com.au:12121$1" | python -m json.tool | less
}

# post call
mwpostpp() {
    # hit the local mw with the endpoint as parameter $1
    curl --data "$1" "${curl_ppopts[@]}" preproduction.i.fetchtv.com.au:12121$2 | python -m json.tool | less
}
