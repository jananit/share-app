class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :catch_exceptions
#To catch the exception
  protected
    def catch_exceptions
      yield
    rescue => exception
      if exception.is_a?(ActiveRecord::RecordNotFound) || exception.is_a?(AbstractController::ActionNotFound)
        flash[:error] = "The file does not exists"
        redirect_to "/"
      end
      
    end
end
