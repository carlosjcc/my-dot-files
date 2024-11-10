# PRODUCTION CALLS

# headers
x_ftv_capabilities_prod="stb-GEN2,99.99,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments,hlsonly,4K,HEVC,ac3"
user_agent_prod="Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)"

# headers
# x_ftv_capabilities_pp="stb-GEN2,99.99,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments,hlsonly,4K,HEVC,ac3,hayu"
x_ftv_capabilities_prod="stb-GEN3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3"
# akhila's
x_ftv_capabilities_prod="ui3.30,stb-MINI,99.99,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,asset_list,tenplay_v2,full_screen_takeover,3.30,ui3.30,passthrough_payments,hlsonly,4K,HEVC,ac3"
user_agent_prod="Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)"
user_agent_prod="FetchTv AppleWebKit"
user_agent_prod="FetchTv AppleWebKit M605T"

# hosuehold
# isp_customer_ref: 'MW Carlos Home'
# uuid: 7d733fdd-8613-4a40-b71e-f1eeb42d2561
# id: 3886824
#
# Terminal.objects.get(mac_address='0C:56:5C:6D:D2:74').household_id

# mighty
# serial number: 971725107197300
# pp_mac_address="0C:56:5C:6D:D2:74"
# pp_token="m2fyr7g2e2"

# mini
# serial number: 272040009705606
pp_mac_address="0C:56:5C:94:18:86"
pp_token="mdcqqa8he3"


# karen
# pp_mac_address="0C:56:5C:5A:ED:D4"
# pp_token="kn7dyb7rt5"

# akhila
# l_mac_address="0C:56:5C:9A:14:83"
# l_token="skcfmtnqwc"

curl_pauth_opts=(
    -c "$cookies_folder"pcookies.txt 
    -H "User-Agent: $user_agent_prod" 
    -H "X-FTV-Capabilties: $x_ftv_capabilities_prod" 
    --data "auth_id=$pp_mac_address&auth_token=$pp_token" 
)

mwauthprod() {
    curl "${curl_pauth_opts[@]}" https://apis.fetchtv.com.au/v2/authenticate | python -m json.tool | less
}

# endpoint calls
curl_popts=(
    -b "$cookies_folder"pcookies.txt 
    -H "User-Agent: $user_agent_prod" 
    -H "X-FTV-Capabilties: $x_ftv_capabilities_prod" 
)

mwprod () {
    # hit production mw with the endpoint as parameter $1
    curl "${curl_popts[@]}" https://apis.fetchtv.com.au$1 | python -m json.tool | less
}

# post call
mwpostprod() {
    # hit the local mw with the endpoint as parameter $1
    curl --data "$1" "${curl_popts[@]}" https://apis.fetchtv.com.au$2# | python -m json.tool | less
}
