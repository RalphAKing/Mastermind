require_relative 'utilities'

CODES = %w[1 2 3 4 5 6]
code = Array.new(4) { CODES.sample }

puts draw_box(
  "Welcome to Mastermind!\n\n" +
  "Guess the secret 4-digit code.\nDigits are between 1 and 6.\n\n" +
  "Perfect match: " + "•".green + "\nColor match: " + "•".blue,
  "MASTERMIND"
)

attempts = 0
while attempts < 10
  puts draw_box("Attempt #{attempts + 1}/10", "YOUR TURN")
  print "Enter your 4-digit guess: ".blue
  user_input = gets.chomp.chars

  if user_input.length == 4 && user_input.all? { |char| CODES.include?(char) }
    if user_input == code
      puts draw_box("🎉 You cracked the code: #{code.join}".green, "YOU WIN")
      break
    else
      hints = compare_arrays(code, user_input)
      puts draw_box(hints, "HINTS")
      attempts += 1
      puts draw_box("#{10 - attempts} attempts remaining.".blue, "INFO")
    end
  else
    puts draw_box("Invalid input. Use 4 digits between 1 and 6.".red, "ERROR")
  end
end

if attempts == 10
  puts draw_box("❌ Game Over! The code was: #{code.join}".red, "GAME OVER")
end
