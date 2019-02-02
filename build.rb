require 'kramdown'

puts "Clearing output directory"
`rm output/*`

Dir['input/*.md'].each do |filename|
  puts "Compiling #{filename} to HTML"

  # Read in Markdown and turn it into HTML
  id = File.basename(filename, ".md")
  markdown = File.read(filename)
  html = Kramdown::Document.new(markdown).to_html

  # Write HTML to output file
  File.open("output/#{id}.html", "w") do |f|
    f.puts html
  end
end
