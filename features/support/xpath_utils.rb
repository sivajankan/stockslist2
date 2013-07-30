module XpathHelper
  #-----------------------------------------------------------------------------
  # To simulate a CSS style class match for xpath, you need to look for 
  # distinct words in the class attribute value. 
  # Usage: page.find(:xpath, "//span[#{xpath_class_match(my_class)}]")
  #-----------------------------------------------------------------------------
  def xpath_class_match(cname)
    "contains(concat(' ',normalize-space(@class),' '),' #{cname} ')"
  end
end

World(XpathHelper)

