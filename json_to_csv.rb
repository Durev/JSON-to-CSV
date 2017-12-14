require 'json'
require 'csv'

file = File.open("users.json").read
json = JSON.parse(file)

# write field names first
# In this case, we assume that all objects are normalized

head = json.first.collect {|key, value| key}

def flatten_hash_keys(nested_hashs)
  #
end

# then write fields

def hash_to_array(hash)
  hash.collect do |key, value|
    case value
    when String, Integer
      value
    when Array
      value.join(",")
    when Hash
      # use recursivity until there aren't anymore nested hashes
    end
  end
end

p hash_to_array(json.first)

# Write in CSV file :

CSV.open("users.csv", "wb") do |csv|
  csv << head
  json.each {|object| csv << hash_to_array(object)}
end
