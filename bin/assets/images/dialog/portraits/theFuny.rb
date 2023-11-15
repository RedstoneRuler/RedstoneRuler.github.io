require 'fileutils'

# Get a list of all files in the current directory
files = Dir.glob('*')

# Iterate over each file
files.each do |file|
  # Check if the file is an image
  if File.extname(file).casecmp('.png').zero? || File.extname(file).casecmp('.jpg').zero? || File.extname(file).casecmp('.jpeg').zero?
    # Extract the file name without extension
    filename = File.basename(file, '.*')

    # Split the words using capital letters and join them with hyphens
    new_filename = filename.gsub(/(?<!\A)(?=[A-Z])/, '-').downcase

    # Generate the new file name with the original extension and convert to lowercase
    new_file = new_filename.downcase + File.extname(file).downcase

    # Rename the file
    File.rename(file, new_file)

    puts "Renamed #{file} to #{new_file}"
  end
end
