# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'confd::default' do

  describe file('/usr/local/bin/confd') do
    it { should be_file }
  end

end
