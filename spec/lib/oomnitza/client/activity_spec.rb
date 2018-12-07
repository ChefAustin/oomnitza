require 'rspec'
require 'spec_helper'

RSpec.describe Oomnitza::Api::Activity do
  before :all do
    Oomnitza::Client.configure(tenant: 'clever', api_key: 'one')
  end

  it "has the correct activities base endpoint" do
    expect(Oomnitza::Api::Activity.base_endpoint).to eq("/activities")
  end

end
