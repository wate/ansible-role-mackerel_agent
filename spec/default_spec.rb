require 'spec_helper'

describe 'role mackerel' do
  describe yumrepo('mackerel') do
    it { should exist }
    it { should be_enabled }
  end
  describe package('mackerel-agent') do
    it { should be_installed }
  end
end
