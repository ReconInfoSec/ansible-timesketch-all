require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe file('/etc/yum.repos.d/_copr_@gift-stable.repo'), :if => os[:family] == 'redhat' do
  it { should exist }
  its(:content) { should match /baseurl=https:\/\/copr-be.cloud.fedoraproject.org\/results\/@gift\/stable\/fedora-$releasever-$basearch\// }
  its(:content) { should match /gpgcheck=1/ }
  its(:content) { should match /enabled=1/ }
end
