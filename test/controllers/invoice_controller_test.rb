require 'test_helper'

class InvoiceControllerTest < ActionDispatch::IntegrationTest
  test "should get upload_file" do
    get invoice_upload_file_url
    assert_response :success
  end

end
