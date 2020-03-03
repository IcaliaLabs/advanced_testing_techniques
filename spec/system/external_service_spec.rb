require 'rails_helper'

RSpec.describe 'ExternalService' do
  it 'it hits an external API' do
    stub_request(:any, 'example.com').to_return(body: '123')
    url = 'http://example.com'

    response = HTTParty.get(url)

    expect(response.body).to be_an_instance_of(String)
  end
end
