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
  puts "Perfect matches #{pmach}\nMatches #{mach-pmach}"
end

CODES = %w[1 2 3 4 5 6]
code = Array.new(4) { CODES.sample }

run = 0
while run != 10
  puts 'enter a number'
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
