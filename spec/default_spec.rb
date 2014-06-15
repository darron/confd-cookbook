# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'confd::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'gets the remote confd file' do
    expect(chef_run).to create_remote_file('/tmp/confd')
  end
end
