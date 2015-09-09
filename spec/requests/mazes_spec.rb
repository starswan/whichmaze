require 'rails_helper'

RSpec.describe "Mazes", type: :request do
  describe "GET /mazes" do
    it "works! (now write some real specs)" do
      get mazes_path
      expect(response).to have_http_status(200)
    end
  end
end
