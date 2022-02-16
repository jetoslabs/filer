# frozen_string_literal: true

require 'json'
require 'set'

require 'thor'

require_relative '../controllers/controllers'


module Filer
  class CLI < Thor

    desc "rename_images_for_valid_url [path, replace_char]", "rename_images_for_valid_url"
    def rename_images_for_valid_url
      dirpath = '/Users/anuragjha/Downloads'
      replace_char = "_"
      do_rename_images_for_valid_url(dirpath, replace_char)
    end

    desc "rename_extension [path, curr_ext, new_ext]", "rename *.jpeg.jpg extension to *.jpg"
    def rename_extension
      dirpath = '/Users/anuragjha/Downloads'
      curr_ext = "jpeg.jpg"
      new_ext = "jpg"
      do_rename_extension(dirpath, curr_ext, new_ext)
    end

    desc "test_yield", "testing yield, args param used by yield block"
    def test_yield
      basepath = '/Users/anuragjha/Downloads'
      smth = "*.{jpg,jpeg,png}"
      replace_char = "_"
      args_for_block = {"replace_char"=> replace_char}
      # os_walk(basepath, smth, args) {|f, args| puts "block!!!!!!!#{f}....#{args}"}
      os_walk(basepath, smth, args_for_block) {|f, args| yield_method1(f, args)}
      args_for_block = {"replace_char"=> replace_char, "new_var"=> "new_var"}
      os_walk(basepath, smth, args_for_block) {|f, args| yield_method2(f, args)}
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
  File.write("./logs/file_renames-#{start_time}.json", renames_json)
end


def do_rename_extension(basepath='.', curr_ext, new_ext)
  start_time = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  print "#{start_time} Starting rename file extension...\n"
  print "curr_ext: #{curr_ext}, new_ext: #{new_ext}\n"

  formatted_filepaths = rename_ext(basepath, curr_ext, new_ext)
  renames_json = formatted_filepaths.to_json
  print "Log file: renames-#{start_time}"
  File.write("./logs/ext_renames-#{start_time}.json", renames_json)
end