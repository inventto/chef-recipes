name "our_rails_app"
description "install everything to run our rails app"
run_list [
  "recipe[mysql]","recipe'[imagemagick]", "recipe[nginx]", "recipe[our_rails_app]"
]
