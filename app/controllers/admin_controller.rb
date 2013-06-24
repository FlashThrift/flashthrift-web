# Controller class for the admin page.
# This confirms that the user is logged in and has admin credentials
# and then displays a page of links for the user to click on.


class AdminController < ApplicationController
  
  # Show the page with all the links to admin things.
  def index

    # if the user isn't logged in, then redirect them to the login page
    if current_user == nil
      redirect_to log_in_url
    end

  end

end
