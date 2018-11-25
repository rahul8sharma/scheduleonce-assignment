class InvoiceController < ApplicationController
  include InvoiceHelper

  # Upload file and parsed it and return parsed file
  def upload_file
    invoice_file = params[:invoice_file]

    redirect_back fallback_location: root_path if invoice_file.blank?

    output_user_story_file = parse_numbers(params[:invoice_file])

    send_file(output_user_story_file.path , :filename => 'output_user_story_1')
  end
end