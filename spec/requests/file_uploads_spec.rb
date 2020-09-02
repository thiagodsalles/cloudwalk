require 'rails_helper'

RSpec.describe "FileUploads", type: :request do
  describe "POST /file_uploads" do
    it "can upload a log" do
      response = HTTP.post('http://localhost:3000/file_upload',
                           form: { file: HTTP::FormData::File.new(file_fixture('qgames.log')) })
      expect(response.code).to eq(200)
    end
  end
end
