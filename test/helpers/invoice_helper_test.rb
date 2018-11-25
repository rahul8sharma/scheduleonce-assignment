require 'test_helper'

class InvoiceHelperTest < ActionView::TestCase
  # Test the output file
  test "should work for parse numbers" do
    input_file_url = 'test/fixtures/files/input_user_story_1.txt'
    input_invoice_file = Rack::Test::UploadedFile.new(input_file_url)
    parsed_file = parse_numbers(input_invoice_file)
    
    output_file_url = 'test/fixtures/files/output_user_story_1.txt'
    input_invoice_file = Rack::Test::UploadedFile.new(output_file_url)

    is_both_file_data_equal = true
    (File.open(parsed_file, 'r')).zip(File.open(input_invoice_file, 'r')) do |input_line, output_line|
      if input_line != output_line
        is_both_file_data_equal = false
      end
    end
    assert_equal true, is_both_file_data_equal
  end
end