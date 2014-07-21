private_ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first
hostname = node[:node][:name]
switch_user = node[:mesos][:switch_user]

directory '/etc/mesos-master' do
  owner 'root'
  group 'root'
  action :create
end

file '/etc/mesos-master/ip' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  content private_ip
end

directory '/etc/mesos-slave' do
  owner 'root'
  group 'root'
  action :create
end

file '/etc/mesos-slave/switch_user' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  content "#{switch_user}"
end

file '/etc/meos-slave/hostname' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  content hostname
end

include_recipe "mesos::master"
include_recipe "mesos::slave"