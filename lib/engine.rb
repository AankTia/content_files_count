module Engine
  def self.read_content(path)
    results = []
    Dir.glob(path).each do |file_name|      
      results << IO.read(file_name) unless File.directory? file_name
    end
    results
  end

  def self.count_contents(arr_contents)
    Struct.new("Result", :contents_count, :max_similar_content)
    result = Struct::Result.new({},{})

    if arr_contents.is_a? Array
      contents_count = {}
      max_similar_content = {}
      included_contents_count = {}

      arr_contents.uniq.each do |uniq_content|
        uniq_content_count = arr_contents.count { |content| content == uniq_content}
        contents_count[uniq_content] = uniq_content_count

        included_content_count = arr_contents.count { |content| content.include?(uniq_content)}
        included_contents_count[uniq_content] = included_content_count
      end   

      max_value = included_contents_count.values.max
      max_similar_content = included_contents_count.select { |key, value| value == max_value}
    
      result.contents_count = contents_count
      result.max_similar_content = max_similar_content
    else
      puts "Invalid Parameter Assigne, Expect in Array"
    end
    result
  end
end