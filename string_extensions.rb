class String
    def green
      "\e[32m#{self}\e[0m"
    end
  
    def blue
      "\e[34m#{self}\e[0m"
    end
  
    def red
      "\e[31m#{self}\e[0m"
    end
  end
  