require 'json'

module PreserveData
  def save_data(data_array, json_file)
    File.write("./data/#{json_file}.json", JSON.generate(data_array), mode: "a")
  end

  def load_data(json_file)
    data = []
    file = "./data/#{json_file}.json"
    return data unless File.exist?(file) && File.read(file) != ''

    if File.empty?("./data/#{json_file}.json")
      puts 'No data in the catalog'
    else
      JSON.parse(File.read("./data/#{json_file}.json"))

    end
  end
end
