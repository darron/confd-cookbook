# encoding: utf-8
#
# Cookbook Name:: confd
# Recipe:: default
#
# Copyright (C) 2014, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef-sugar::default'

remote_file node['confd']['tmp'] do
  source node['confd']['url']
  owner 'root'
  group 'root'
  mode 00755
  not_if { File.exist?('/usr/local/bin/confd') }
end

bash 'install confd' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    mv confd /usr/local/bin
    chmod 755 /usr/local/bin/confd
  EOH
  only_if { File.exist?('/tmp/confd') }
  not_if { File.exist?('/usr/local/bin/confd') }
end

node['confd']['folders'].each do |path|
  directory "/etc/confd/#{path}" do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
    action :create
  end
end
