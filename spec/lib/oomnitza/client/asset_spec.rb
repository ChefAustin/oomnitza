require 'rspec'
require 'spec_helper'

RSpec.describe Oomnitza::Api::Asset do
  before :all do
    Oomnitza::Client.configure(tenant: 'clever', api_key: 'one')
  end

  it 'has the correct assets base endpoint' do
    expect(Oomnitza::Api::Asset.base_endpoint).to eq('/assets')
  end
end
