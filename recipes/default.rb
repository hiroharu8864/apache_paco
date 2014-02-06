#
# Cookbook Name:: apache_paco
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# Disable iptables
service "iptables" do
  action [ :disable, :stop ]
end
