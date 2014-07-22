private_ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first
hostname = node[:node][:name]
switch_user = node[:singularity][:mesos][:switch_user]
mesos_version = node[:singularity][:mesos][:version]

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

apt_package "mesos" do
  action :install
  version mesos_version
end