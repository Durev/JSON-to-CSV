
# JSON to CSV

JSON to CSV file converter in Ruby

## Getting Started

Git clone or download this repository.

## Converting from JSON to CSV

### Update path names

Update `json_file_path` with your json file path and name, and `csv_result_path` with the desired CSV output file name (make sure to use an existing directory for the output).

```
# --- Select desired path ---
json_file_path = "foo/bar/my_json_file.json"
csv_result_path = "my_result.csv"
# ---------------------------
```

### Convert

Run the *json_to_csv.rb* file

```
$ ruby json_to_csv.rb
```
A new *.csv* file will be created.

## Notes

Don't forget to change your CSV output file name when you convert a new file, as every new execution will overwrite the content of the existing file.

Note that only JSON format is valid.

Nested hashes are supported.
e.g.
```
[
  {
    "id": 0,
    "email": "colleengriffith@quintity.com",
    "tags": [
      "consectetur",
      "quis"
    ],
    "profiles": {
      "facebook": {
        "id": 0,
        "picture": "//fbcdn.com/a2244bc1-b10c-4d91-9ce8-184337c6b898.jpg"
      },
      "twitter": {
        "id": 0,
        "picture": "//twcdn.com/ad9e8cd3-3133-423e-8bbf-0602e4048c22.jpg"
      }
    }
  }
]
```
