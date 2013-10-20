module NavigationHelpers
  
 def selector_for(locator)
    case locator
    when /the page/
      "html > body"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #  when /the (notice|error|info) flash/
    #    ".flash.#{$1}"
    when /the fancy box/
      [:xpath, "//div[@id='zoom']"]
      
    when /the "([^"]*)" table/
      [:xpath, "//table[@id='#{$1}']"]
      
    when /new stocklist container/
      [:xpath, "//div[@id='stocklist-new-container']"]
      
    when /view stocklist container/
      [:xpath, "//div[@id='stocklist-view-container']"]      
      
    when /list stocklist container/
      [:xpath, "//div[@id='stocklist-list-container']"]  
      
    # You can also return an array to use a different selector
    # type, like:
    #
    #  when /the header/
    #    [:xpath, "//header"]

    # This allows you to provide a quoted selector as the scope
    # for "inside" steps as was previously the default for the
    # web steps:
    when /"(.+)"/
      $1

    else
      raise "Can't find mapping from \"#{locator}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end      
  end

  def path_to(page_name)

    case page_name

    when /the home\s?page/
      '/'
    when /the sign up page/
      '/users/sign_up'
    when /the sign up page/
      '/users/sign_in'
    
    # more mappings here
    # an example
    # when /^(.*)'s profile page$/i
    #   user_profile_path(User.find_by_login($1))
    #
    else
      begin
        page_name =~ /the (.*) page/
        page_components = $1.split(/\s+/)
        self.send path_components.push('path').join('-').to_sym
      rescue Object => e
        raise "Can't find mapping from '#{page_name}' to a path.\n" +
              "Now, go and add a mapping in #{__FILE__}"
      end
    end
        
  end  
  
end

World(NavigationHelpers)
