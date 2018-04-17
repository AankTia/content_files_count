module Engine
  def self.read_content(path)
    results = []
    Dir.glob(path).each do |file_name|      
      results << IO.read(file_name) unless File.directory? file_name
    end
    results
  end
end