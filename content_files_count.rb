require './lib/engine.rb'

class ContentFilesCount
  paths = ARGV
  if !paths.empty?
    file_contents = []
    paths.each do |path|
      path = "#{path}/**/*"
      file_contents += Engine.read_content(path)
    end
    result = Engine.count_contents(file_contents)

    puts 'Number of File with Same Contents'
    result.contents_count.each { |content,value| puts "#{content}: #{value}" }
    puts 

    puts 'Max Similar Content'
    result.max_similar_content.each { |content,value| puts "#{content}: #{value}"}
  else
    puts 'Missing Path Directory. Please specify target Directory'
    puts "Example: ruby content_files_count.rb './folder1' './folder2'"
  end
end