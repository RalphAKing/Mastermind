class String
    def green;          "\e[32m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    end
    
    def comparearrays(code, input)
      pmach=0
      mach=0
      index=0
      for i in code
        if input[index] == i
          pmach+=1
        end
        index+=1
      end
      cindex=0
      maches=[]
      for i in code
        for j in input
          if i==j
            found=0
            for q in maches
              if q==cindex
                found=1
              end
            end
            if found == 0
              maches.append(cindex)
              mach+=1
            end
          end
        end 
        cindex+=1
      end
      puts 'hints: ' + '•'.green*pmach + '•'.blue*(mach-pmach)
    end
    
    CODES = %w[1 2 3 4 5 6]
    code = Array.new(4) { CODES.sample }
    puts 'You need to guess the right 4 digit code.'
    puts 'the numbers are from 1-6'
    puts 'You will get 10 attempts.'
    puts 'On each go you get given hints'
    puts 'Perfect match ' + '•'.green
    puts 'Match ' + '•'.blue
    
    run = 0
    while run != 10
      puts 'enter a number:'
      userinput = gets.chomp.chars
    
      if userinput.length == 4
        if code == userinput
          puts 'you won'
          run = 10
        else
          comparearrays(code, userinput)
          run += 1
        end
      else
        puts 'Invalid Input'
      end
      
    end
    