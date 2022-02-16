# frozen_string_literal: true

require 'json'
require 'set'

require 'thor'

require_relative '../controllers/controllers'


module Filer
  class CLI < Thor

    desc "rename_for_valid_url [path, replace_char]", "rename images for valid url"
    def rename_for_valid_url
      basepath = '/Users/anuragjha/Downloads'
      smth = "*.{jpg,jpeg,png}"
      replace_char = "_"
      input_args = {"replace_char" => replace_char, "output" => {}}
      returned_args = os_walk(basepath, smth, input_args) do |f, args|
        yield_method_rename_filename_for_valid_url(f, args)
      end
      puts "returned: #{returned_args["output"]}"
      File.write("./logs/rename_for_valid_url.json", returned_args["output"].to_json)
    end

    desc "rename_extension [path, curr_ext, new_ext]", "rename extension"
    def rename_extension
      basepath = '/Users/anuragjha/Downloads'
      curr_ext = "jpeg.jpg"
      new_ext = "jpg"
      yield_args = {"curr_ext" => curr_ext, "new_ext" => new_ext, "output" => {}}
      returned_args = os_walk(basepath, "*.{#{curr_ext}}", yield_args) do |f, args|
        yield_method_rename_ext(f, args)
      end
      puts "returned: #{returned_args["output"]}"
      File.write("./logs/rename_for_valid_url.json", returned_args["output"].to_json)
    end

  end
end
