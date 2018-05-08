#
# Cookbook Name:: newrelic_new
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

newrelic_key = File.open('/etc/newrelic/nrsysmond.cfg').grep(/license_key=/).first.split('=')[1].chomp

file '/etc/newrelic-infra.yml' do
  content "license_key: #{newrelic_key}"
end

apt_repository 'newrelic-infra' do
  uri 'http://download.newrelic.com/infrastructure_agent/linux/apt'
  components ['main']
  distribution 'trusty'
  arch 'amd64'
  key 'https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg'
end

package 'newrelic-infra'

service 'newrelic-infra' do
  action [:enable, :start]
end

service 'newrelic-sysmond' do
  action [:disable, :stop]
end
