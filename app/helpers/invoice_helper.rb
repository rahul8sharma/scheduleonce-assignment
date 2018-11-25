module InvoiceHelper
  include FileHelper

  # Parse invoice number to actual number and put into file
  def parse_numbers(invoice_file)
    orginal_invoice_number = []
    output_user_story_file = new_file("public/invoice_file/output_user_story_#{Time.now.to_i}.txt", "w")

    open_file(invoice_file.path).each_with_index do |line,i|
      # Store all 3 lines of file that have invoice number
      # If line is equal to 4 then process it
      if i % 4 != 3
        orginal_invoice_number.push(line)
      else
        parsed_invoice_number = get_parsed_invoice_number(orginal_invoice_number)
        put_in_file(output_user_story_file, parsed_invoice_number)
        orginal_invoice_number = []
      end
    end
    close_file(output_user_story_file)

    return output_user_story_file
  end

  # Get parsed number
  def get_parsed_invoice_number(orginal_invoice_number)
    parsed_invoice_number = ''
    number_zero_index = 0
    number_one_index = 1
    number_two_index = 2
    # Iteare all 9 number of invoice to get actual number
    9.times do |number|
      if orginal_invoice_number[0][number_one_index] == '_'
        if orginal_invoice_number[1][number_two_index] == '|'
          if orginal_invoice_number[1][number_zero_index] == '|'
            if orginal_invoice_number[2][number_zero_index] == '|'
              if orginal_invoice_number[1][number_one_index] == '_'
                parsed_invoice_number = parsed_invoice_number + '8'
              else
                parsed_invoice_number = parsed_invoice_number + '0'
              end
            else
              parsed_invoice_number = parsed_invoice_number + '9'
            end
          elsif orginal_invoice_number[2][number_zero_index] == '|'
            parsed_invoice_number = parsed_invoice_number + '2'
          elsif orginal_invoice_number[1][number_one_index] == '_'
            parsed_invoice_number = parsed_invoice_number + '3'
          else
            parsed_invoice_number = parsed_invoice_number + '7'
          end
        elsif orginal_invoice_number[2][number_zero_index] == '|'
          parsed_invoice_number = parsed_invoice_number + '6'
        else
          parsed_invoice_number = parsed_invoice_number + '5'
        end
      elsif orginal_invoice_number[1][number_one_index] == '_'
        parsed_invoice_number = parsed_invoice_number + '4'
      else
        parsed_invoice_number = parsed_invoice_number + '1'
      end
      number_zero_index = number_zero_index + 3
      number_one_index = number_one_index + 3
      number_two_index = number_two_index + 3
    end
    parsed_invoice_number
  end
end
