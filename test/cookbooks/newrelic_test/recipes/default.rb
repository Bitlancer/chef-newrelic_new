#
# Cookbook Name:: newrelic_test
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

directory '/etc/newrelic' do
  action :create
end.run_action(:create)

cookbook_file '/etc/newrelic/nrsysmond.cfg' do
  source 'nrsysmond.cfg'
end.run_action(:create)

include_recipe 'newrelic_new'
