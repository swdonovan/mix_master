require 'rails_helper'

RSpec.describe Song, type: :model do
  context "validations" do
    it { should have_many(:playlists) }
  end
end
