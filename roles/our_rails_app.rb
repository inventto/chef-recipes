name "our_rails_app"
description "install everything to run our rails app"

run_list [
  "recipe[bluepill]", "recipe[mysql]","recipe[imagemagick]", "recipe[nginx]", "role[our_rails_app]"
]
