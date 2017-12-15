require 'json'
require 'csv'

# --- Select desired path ---
json_file_path = "users.json"
csv_result_path = "users.csv"
# ---------------------------

json_file = File.open(json_file_path).read
json = JSON.parse(json_file)

# Get field names first - In this case, we assume that all objects are normalized
def get_fields_name(object, path = nil)
  case object
  when Hash
    object.collect do |key, value|
      if path
        get_fields_name(value, "#{path}.#{key}")
      else
        get_fields_name(value, "#{key}")
      end
    end.flatten
  else
    path
  end
end

# Then get fields content
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
  end.flatten
end

# Write in CSV file
CSV.open(csv_result_path, "wb") do |csv|
  csv << get_fields_name(json.first)
  json.each {|object| csv << hash_to_array(object)}
end
