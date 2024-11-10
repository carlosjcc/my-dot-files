# reference to function for curl
# https://unix.stackexchange.com/questions/475846/concatenate-and-use-multi-line-variable-in-multi-line-curl-execution/475904#475904

# redis
alias redis='redis-cli'
alias redispp='redis-cli -h 10.60.81.161 -p 6380'
alias redis-pre='redis-cli -h 10.80.72.20 -p 6380'

# jobs
alias j='jobs -l'
alias km="jobs -p | xargs kill"
# alias km='jpkill -f \"python server\"'

# pdb
alias bp='vim ~/.pdbrc'

# mw
alias mwd='PYTHONPATH="../lib" python server.py'
alias mwdnc='PYTHONPATH="../lib" python server.py  --debug --capture_request_context --enable_memory_cache=0 --redis_response_cache=0'
alias mw='PYTHONPATH="../lib" python server.py  --debug --capture_request_context >> >(tee -a ~/projects/mw2/logs/stdout.log) 2>> >(tee -a ~/projects/mw2/logs/stderr.log >&2)'
alias mwterm='cd ~/projects/mw2/middle/ && pyenv activate mw && clear'
alias mw3term='cd ~/projects/middleware-python-3/mw && pyenv activate mw3 && source ~/.bash_profile && clear'
alias mwdkr='PYTHONPATH=../lib python dev_dataset_server.py --dev_dataset_offset=0 --debug --processes=1 --enable_memory_cache=0 --redis_response_cache=0  --enable_central_cache_manager=0'

# prov
alias dev_dataset="DJANGO_SETTINGS_MODULE=provisioning.dev_dataset_settings python manage.py"
alias pro='python manage.py runserver 0.0.0.0:8000'
alias contp='python manage.py continuous_provisioning actionable_virtual_channels applications channels content_classes curated_content_lists drm_bin_data_files editorial_item_lists editorial_mapping_lists entitlements gen3_netflix_binfiles gen4_mac_addresses households isps item_list_provisioning_request logout_devices mac_and_serials object_store_image_presets object_store_images:2 packages plans prepared_items program_relink provision_household_if_plan_missing provision_image_maps_to_redis rate_limits ratings redis_households releases request_image_provisioning settings subscriber_tags terminal_netflix title_tree_relink vod_price_rules'
alias contppp='dev_dataset continuous_provisioning actionable_virtual_channels applications channels content_classes curated_content_lists drm_bin_data_files editorial_item_lists editorial_mapping_lists entitlements gen3_netflix_binfiles gen4_mac_addresses households isps item_list_provisioning_request logout_devices mac_and_serials object_store_image_presets object_store_images:2 packages plans prepared_items program_relink provision_household_if_plan_missing provision_image_maps_to_redis rate_limits ratings redis_households releases request_image_provisioning settings subscriber_tags terminal_netflix title_tree_relink vod_price_rules'
alias proterm='cd ~/projects/provisioning/provisioning && pyenv activate prov_django4 && clear'
alias prov4term='cd /Users/carlos/projects/prov_django4/provisioning && pyenv activate prov_django4 && clear'

alias sterm='cd ~/projects/search_server && pyenv activate search && clear'
alias pptunnel='ssh -L 9000:preprod.rds.fetchtv.com.au:3306 carlos@sv425-mwpp1.eq.i.fetchtv.com.au'

# sui
alias stb='/Applications/Chromium.app/Contents/MacOS/Chromium --no-sandbox --disable-setuid-sandbox --disable-web-security --window-size=1700,1400 --disable-infobars --user-data-dir="~/Library/Application Support/Chromium/Default"  --disable-features=SameSiteByDefaultCookies,CookiesWithoutSameSiteMustBeSecure --auto-open-devtools-for-tabs --user-agent="FetchTv AppleWebKit M605T" "http://localhost:8080/index.htm"'

# calls

# cookies folder
cookies_folder="/Users/carlos/Documents/mw-calls/cookies/"


# walled garden end point calls
source ~/.mw-local-endpoints.sh

# walled garden end point calls
source ~/.mw-preprod-endpoints.sh

# walled garden end point calls
source ~/.mw-prod-endpoints.sh

# walled garden end point calls
source ~/.mw-walled-garden-endpoints.sh


alias c='curl -b cookies.txt  --header "X-FTV-Capabilties: $x_ftv_capabilities" 127.0.0.1:12121$1 | python -m json.tool | less'
alias rod='curl -b cookies.txt  --header "X-FTV-Capabilties: stb-GEN3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3" 127.0.0.1:12121/v4/epg/channels | python -m json.tool | less'

alias lauth='curl -c cookies.txt --header "User-Agent: $user_agent" --header "X-FTV-Capabilties: $x_ftv_capabilities" --data "auth_id=0C:56:5C:6D:D2:74&auth_token=m2fyr7g2e2" 127.0.0.1:12121/v2/authenticate | python -m json.tool | less'

alias pauth='curl -c pcookies.txt -H "User-Agent: Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)" --header "X-FTV-Capabilties: stb-Gen3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3,4K" --data "auth_id=0C:56:5C:6D:9C:4A&auth_token=5pgduuszkx" https://apis.fetchtv.com.au/v2/authenticate | python -m json.tool | less'
alias ppauth='curl -c ppcookies.txt -H "User-Agent: Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)" --header "X-FTV-Capabilties: stb-Gen3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3,4K" --data "auth_id=0C:56:5C:6D:9C:4A&auth_token=5pgduuszkx" http://10.65.72.121:12121/v2/authenticate | python -m json.tool | less'

# ngrok
alias ngrokpro='cd ~/Downloads/ && ./ngrok http -region=au 8000'
alias ngrokmw='cd ~/Downloads/ && ./ngrok http 12121'

# sui
alias sui='cd /Users/carlos/projects/sui && clear && gulp hostserver'
