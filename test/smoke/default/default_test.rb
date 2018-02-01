# # encoding: utf-8

# Inspec test for recipe test::default

describe command('git') do
  it { should exist }
  its('exit_status') { should eq 1 }
  its('stdout') { should include('usage: git') }
end

describe file('/etc/profile.d/nodenv.sh') do
  it { should exist }
end

global_version = '8.2.1'

describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/nodenv.sh && nodenv global"') do
  its('exit_status') { should eq 0 }
  its('stdout') { should include(global_version) }
  its('stdout') { should_not match(/system/) }
end
