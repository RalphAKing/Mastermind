require_relative 'string_extensions'

def strip_colors(text)
  text.gsub(/\e\[[0-9;]*m/, '') 
end

def draw_box(content, title = "")
  box_width = [strip_colors(content).lines.map(&:length).max, title.length].max + 4
  top_border = "╔" + "═" * (box_width - 2) + "╗"
  bottom_border = "╚" + "═" * (box_width - 2) + "╝"
  title_line = title.empty? ? "" : "║ #{title.center(box_width - 4)} ║"
  content_lines = content.lines.map { |line| "║ #{line.strip.ljust(box_width - 4)} ║" }
  [top_border, title_line, *content_lines, bottom_border].compact.join("\n")
end

def compare_arrays(code, input)
  perfect_matches = 0
  color_matches = 0
  used_code_indices = []
  used_input_indices = []

  code.each_with_index do |c, index|
    if c == input[index]
      perfect_matches += 1
      used_code_indices << index
      used_input_indices << index
    end
  end

  code.each_with_index do |c, c_index|
    next if used_code_indices.include?(c_index)

    input.each_with_index do |i, i_index|
      next if used_input_indices.include?(i_index)

      if c == i
        color_matches += 1
        used_code_indices << c_index
        used_input_indices << i_index
        break
      end
    end
  end

  "Hints: " + ('•'.green * perfect_matches) + ('•'.blue * color_matches)
end
