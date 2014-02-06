#
# Cookbook Name:: apache_paco
# Recipe:: paco
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
paco_file="paco-2.0.9"

cookbook_file "#{Chef::Config[:file_cache_path]}/#{paco_file}.tar.gz" do
  mode 0644
end

%w{gcc gcc-c++}.each do |pkg|
  package pkg do
    action :install
  end
end

script "install paco" do
  interpreter "bash"
  user "root"
  cwd Chef::Config[:file_cache_path]
  code <<-EOL
    tar -zxvf #{paco_file}.tar.gz
    cd #{paco_file}
    ./configure #{node[:paco][:opt].join(' ')}
    make -j$(expr `grep '^processor' /proc/cpuinfo | wc -l` + 1)
    make install
    make logme
  EOL
  not_if "which paco"
end

