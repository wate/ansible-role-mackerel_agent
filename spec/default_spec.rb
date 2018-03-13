require 'spec_helper'

describe yumrepo('mackerel') do
  it { should exist }
  it { should be_enabled }
end

describe package('mackerel-agent') do
  it { should be_installed }
end

describe file('/etc/mackerel-agent/mackerel-agent.conf') do
  it { should exist }
  it { should be_file }
  it { should contain 'apikey = "' + property['mackerel_agent_apikey'] + '"' }
end

if property['mackerel_agent_install_agent_plugins']
  describe package('mackerel-agent-plugins') do
    it { should be_installed }
  end
end

if property['mackerel_agent_install_check_plugins']
  describe package('mackerel-check-plugins') do
    it { should be_installed }
  end
end

describe service('mackerel-agent') do
  it { should be_enabled }
  if property['mackerel_agent_active_and_enabled_on_system_startup']
    it { should be_running }
  else
    it { should_not be_running }
  end
end
