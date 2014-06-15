# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'confd::default' do

  describe file('/usr/local/bin/confd') do
    it { should be_file }
  end

  describe file('/etc/confd/conf.d') do
    it { should be_directory }
  end

  describe file('/etc/confd/templates') do
    it { should be_directory }
  end

end
