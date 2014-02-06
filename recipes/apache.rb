#
# Cookbook Name:: apache_paco
# Recipe:: apache
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
%w{openssl-devel pcre-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

node.apache24.packages.each do |k,v|
  cookbook_file "#{Chef::Config[:file_cache_path]}/#{v[:source]}.tar.gz" do
    mode 0644
  end

  script "install #{k}" do
    interpreter "bash"
    user "root"
    cwd Chef::Config[:file_cache_path]
    code <<-EOL
      tar zxvf #{v[:source]}.tar.gz && cd #{v[:source]}
      ./configure #{v[:opt].join(' ')}
      make -j$(expr `grep '^processor' /proc/cpuinfo | wc -l` + 1)
      #{node.paco.bin} -D make install
    EOL
    not_if "#{node[:paco][:bin]} #{k}"
  end
end
