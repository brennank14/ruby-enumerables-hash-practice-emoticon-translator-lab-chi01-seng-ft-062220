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
  library.each do |key, value|
    binding.pry
    if emoticon == library[key][:english]
      binding.pry
      new_hash[key][:japanese]
    else
      "Sorry, that emoticon was not found"
    end
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
