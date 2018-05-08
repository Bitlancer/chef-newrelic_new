# # encoding: utf-8

# Inspec test for recipe newrelic_new::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe file('/etc/apt/sources.list.d/newrelic-infra.list') do
  it { should exist }
  it { should be_file }
end

describe file('/etc/newrelic-infra.yml') do
  it { should exist }
  it { should be_file }
  its(:content) { should match /license_key:\ [0-9a-f]{40}/ }
end

describe service('newrelic-infra') do
  it { should be_enabled }
  it { should be_running }
end

describe service('newrelic-sysmond') do
  it { should_not be_enabled }
  it { should_not be_running }
end
