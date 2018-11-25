class MacroPoloController < ApplicationController
  def get_marco_polo
    @marco_polo_string = '';
    100.times do |index|
      number = index + 1
      if(number % 4 == 0 && number % 7 == 0)
        @marco_polo_string = @marco_polo_string + 'marcopolo,';
      elsif (number % 4 == 0)
        @marco_polo_string = @marco_polo_string + 'marco,';
      elsif(number % 7 == 0)
        @marco_polo_string = @marco_polo_string + 'polo,';
      else
        @marco_polo_string = @marco_polo_string + number.to_s + ',';
      end
    end
  end
end
