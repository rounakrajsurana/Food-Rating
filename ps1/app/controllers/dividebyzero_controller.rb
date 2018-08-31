class DividebyzeroController < ApplicationController
  def divided
     require 'logger'
     logger.fatal("About to divide by zero !!")
     @zero_exception = 5/0
  end	
end
