require 'pry'
require "yaml"


def load_library(translations)
  dictionary = YAML.load_file(translations)
  new_hash = {}

  dictionary.each do |key, value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
    end
  new_hash
end


def get_japanese_emoticon (translations, emoticon)
  library = load_library(translations)
  found_emoticon = library.keys.find do |key|
    #binding.pry
    emoticon == library[key][:english]
  end

    if found_emoticon
      #binding.pry
      library[found_emoticon][:japanese]
    else
      "Sorry, that emoticon was not found"
    end
end


def get_english_meaning(translations, emoticon)
  load_library(translations) do |key, value|
    if emoticon == new_hash[key][:japanese]
      new_hash[key]
    else
      "Sorry, that emoticon was not found"
    end
  end
end
