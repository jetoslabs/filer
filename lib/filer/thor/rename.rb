# frozen_string_literal: true

require 'json'
require 'set'

require 'thor'

require_relative '../os_walk'


module Filer
  class CLI < Thor

    desc "rename_images_for_valid_url [path]", "rename_images_for_valid_url"
    def rename_images_for_valid_url
      dirpath = '/Users/anuragjha/Downloads'
      replace_char = "_"
      do_rename_images_for_valid_url(dirpath, replace_char)
    end

    desc "rename *.jpeg.jpg extension to *.jpg", "rename *.jpeg.jpg extension to *.jpg"
    def rename_extension
      dirpath = '/Users/anuragjha/Downloads'
      curr_ext = "jpeg.jpg"
      new_ext = "jpg"
      do_rename_extension(dirpath, curr_ext, new_ext)
    end

  end
end



def do_rename_images_for_valid_url(dirpath='.', replace_char = "_")
  start_time = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  print "#{start_time} Starting format_filenames...\n"
  print "replace_char: #{replace_char}\n"

  formatted_filepaths = rename_image_filenames_for_valid_url(dirpath, replace_char)
  renames_json = formatted_filepaths.to_json
  print "Log file: renames-#{start_time}"
  File.write("./file_renames-#{start_time}.json", renames_json)
end


def do_rename_extension(basepath='.', curr_ext, new_ext)
  start_time = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  print "#{start_time} Starting rename file extension...\n"
  print "curr_ext: #{curr_ext}, new_ext: #{new_ext}\n"

  formatted_filepaths = rename_ext(basepath, curr_ext, new_ext)
  renames_json = formatted_filepaths.to_json
  print "Log file: renames-#{start_time}"
  File.write("./ext_renames-#{start_time}.json", renames_json)
end