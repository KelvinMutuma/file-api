require "test_helper"
require "app"

describe "Upload a file" do
  include Rack::Test::Methods

  def app
    API::App
  end

  it "uploads a file" do
    file_path = fixture_path "err.zip" 
 
    post "/files", {
      file: {
        title: "My First zip file",
        file: Rack::Test::UploadedFile.new(file_path, "application/zip", true)
      }
    }

    last_response.status.must_equal  201
  end
end
