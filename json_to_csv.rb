require 'json'
require 'csv'

file = File.open("users.json").read
json = JSON.parse(file)

# Write field names first
# In this case, we assume that all objects are normalized

head = json.first.collect {|key, value| key}

# Then write fields

def hash_to_array(hash)
  hash.collect do |key, value|
    case value
    when String, Integer
      value
    when Array
      value.join(",")
    when Hash
      hash_to_array(value)
    end
  end
  .flatten
end

# Write in CSV file

CSV.open("users.csv", "wb") do |csv|
  csv << head
  json.each {|object| csv << hash_to_array(object)}
end
