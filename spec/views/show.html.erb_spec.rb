require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  before do
    assign(:product, build_stubbed(:product))
    allow(view).to receive(:user_signed_in?).and_return(true)
  end

  context 'when user is admin' do
    it 'renders a destroy link' do
      allow(view).to receive(:current_user).and_return(build_stubbed(:user, :as_admin))

      render

      expect(rendered).to include 'Destroy'
    end
  end
  
  context 'when user is not admin' do
    it 'does not render a destroy link' do
      allow(view).to receive(:current_user).and_return(build_stubbed(:user))

      render

      expect(rendered).not_to include 'Destroy'
    end
  end
end
