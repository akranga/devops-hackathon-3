require 'serverspec'
require 'pathname'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
    c.path = '/sbin:/usr/sbin'
  end
end

describe service('mysql') do
  it { should be_enabled }
  it { should be_running }
end

describe port(3306) do
  it { should be_listening }
end