# require modules here
require "yaml"
require "pry"


def load_library(file_name)
  # code goes here
  emoticons = YAML.load_file(file_name)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |title, emoticons|
    library["get_meaning"][emoticons[1]] = title
    library["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  library
end

def get_japanese_emoticon(file_name, english_emoticon)
  # code goes here
  dictionary = load_library(file_name)
  if dictionary["get_emoticon"].keys.include?(english_emoticon)
    return dictionary["get_emoticon"][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_name, emoticon)
  # code goes here
  dictionary = load_library(file_name)
  if dictionary["get_meaning"].keys.include?(emoticon)
    return dictionary["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end