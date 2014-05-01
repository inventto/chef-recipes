package "git-core"
username = node["user"]["name"]
user username do
   password  node["user"]["password"]
   gid "root"
   home "/home/#{username}"
   supports manage_home: true
end

template "/home/#{username}/.zshrc" do
  source "zshrc.erb"
  owner username
end

