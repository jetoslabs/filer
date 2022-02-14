# frozen_string_literal: true

require 'json'
require 'set'

require 'thor'

require_relative '../os_walk'


module Filer
  class CLI < Thor

    desc "rename_images_to_valid_url [path]", "rename_images_to_valid_url"
    def rename_images_for_valid_url
      dirpath = '/Users/anuragjha/Downloads'
      replace_char = "_"
      main(dirpath, replace_char)
    end

  end
end



def main(dirpath='.', replace_char = "_")
  start_time = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  print "#{start_time} Starting format_filenames...\n"
  print "replace_char: #{replace_char}\n"

  formatted_filepaths = rename_image_filenames_for_valid_url(dirpath, replace_char)
  renames_json = formatted_filepaths.to_json
  print "Log file: renames-#{start_time}"
  File.write("./renames-#{start_time}.json", renames_json)
end