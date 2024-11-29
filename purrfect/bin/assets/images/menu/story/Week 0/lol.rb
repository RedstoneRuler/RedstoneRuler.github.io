require 'fileutils'

def rename_files(directory)
  Dir.foreach(directory) do |filename|
    next if filename == '.' || filename == '..'  # Skip current and parent directories
    next unless File.file?(File.join(directory, filename))  # Skip directories
    
    new_filename = filename.gsub('Tutorial', 'Week0')
    new_path = File.join(directory, new_filename)
    old_path = File.join(directory, filename)
    
    next if new_path == old_path  # Skip if the filename doesn't need to be changed
    
    puts "Renaming #{old_path} to #{new_path}"
    FileUtils.mv(old_path, new_path)
  end
end

directory_path = '.'
rename_files(directory_path)
