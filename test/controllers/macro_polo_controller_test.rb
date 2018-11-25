require 'test_helper'

class MacroPoloControllerTest < ActionDispatch::IntegrationTest
  test "should get get_marco_polo" do
    get macro_polo_get_marco_polo_url
    assert_response :success
  end

end
