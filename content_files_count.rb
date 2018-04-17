require './lib/engine.rb'

class ContentFilesCount  
  if ARGV.length != 1
    puts 'We need exactly one path directory parameter'
    path = nil
  else
    path = (ARGV[0] != nil) ? "#{ARGV[0]}/**/*" : nil
  end

  if path != nil
    file_contents = Engine.read_content(path)
    result = Engine.count_contents(file_contents)

    puts 'Number of File with Same Contents'
    result.contents_count.each { |content,value| puts "#{content}: #{value}" }
    puts 

    puts 'Max Similar Content'
    result.max_similar_content.each { |content,value| puts "#{content}: #{value}"}
  else
    puts 'Missing Path Directory. Please specify target Directory'
    puts 'Eq: ruby content_files_count.rb ./document'
  end
end