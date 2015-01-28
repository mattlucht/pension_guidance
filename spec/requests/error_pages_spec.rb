RSpec.describe 'Error pages', type: :request do
  specify '404' do
    get '/guides/non-existent-guide'

    expect(response).to be_not_found
    expect(response).to render_template(:not_found)
  end
end
