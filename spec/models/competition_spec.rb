require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many(:team_comps) }
    it { should have_many(:teams).through(:team_comps) }
  end
end
