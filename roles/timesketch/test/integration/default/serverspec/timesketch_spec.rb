require 'serverspec'

# Required by serverspec
set :backend, :exec

describe process("tsctl") do

  its(:user) { should eq "_timesketch" }

  it "is listening on port 5000" do
    expect(port(5000)).to be_listening
  end

end

