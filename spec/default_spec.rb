# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'confd::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'gets the remote confd file' do
    expect(chef_run).to create_remote_file('/tmp/confd')
  end

  it 'creates the config directories' do
    expect(chef_run).to create_directory('/etc/confd/conf.d')
  end

  it 'creates the config directories' do
    expect(chef_run).to create_directory('/etc/confd/templates')
  end
end
