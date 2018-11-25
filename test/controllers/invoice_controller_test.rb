require 'test_helper'

class InvoiceControllerTest < ActionDispatch::IntegrationTest
  test "should post upload_file" do
    file_url = 'test/fixtures/files/input_user_story_1.txt'
    invoice_file = Rack::Test::UploadedFile.new(file_url)
    post invoice_upload_file_url, params: { invoice_file: invoice_file }

    assert_response 200
    assert_response :success
  end
end
