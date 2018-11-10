require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe file('/etc/apt/sources.list.d/ppa_gift_stable_xenial.list'), :if => os[:family] == 'ubuntu' && os[:release] == '16.04' do
  it { should exist }
  its(:content) { should match /deb http:\/\/ppa.launchpad.net\/gift\/stable\/ubuntu xenial main/ }
end

describe file('/etc/apt/sources.list.d/ppa_gift_stable_trusty.list'), :if => os[:family] == 'ubuntu' && os[:release] == '14.04' do
  it { should exist }
  its(:content) { should match /deb http:\/\/ppa.launchpad.net\/gift\/stable\/ubuntu trusty main/ }
end

