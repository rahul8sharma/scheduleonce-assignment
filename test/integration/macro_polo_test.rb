require 'test_helper'

class MacroPoloTest < ActionDispatch::IntegrationTest
  test "can see the title" do
    get "/macro_polo/get_marco_polo"
    assert_select "h1", "Macro Polo Example"
  end

  test "Is macro polo test valid for 1 to 100" do
    get "/macro_polo/get_marco_polo"
    assert_select "p", "1,2,3,marco,5,6,polo,marco,9,10,11,marco,13,polo,15,marco,17,18,19,marco,polo,22,23,marco,25,26,27,marcopolo,29,30,31,marco,33,34,polo,marco,37,38,39,marco,41,polo,43,marco,45,46,47,marco,polo,50,51,marco,53,54,55,marcopolo,57,58,59,marco,61,62,polo,marco,65,66,67,marco,69,polo,71,marco,73,74,75,marco,polo,78,79,marco,81,82,83,marcopolo,85,86,87,marco,89,90,polo,marco,93,94,95,marco,97,polo,99,marco,"
  end
end
