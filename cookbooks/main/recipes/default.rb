
package "apt"
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

deploy "/var/apps/tavernas" do
  repo "git@github.com/inventto/tavernas"
  revision "HEAD" # or "TAG_for_1.0" or (subversion) "1234"
  user "inventtores"
  enable_submodules true
  migrate true
  migration_command "rake db:migrate"
  environment "RAILS_ENV" => "production"
  shallow_clone true
  keep_releases 10
  action :deploy # or :rollback
  restart_command "touch tmp/restart.txt"
  git_ssh_wrapper "wrap-ssh4git.sh"
end
