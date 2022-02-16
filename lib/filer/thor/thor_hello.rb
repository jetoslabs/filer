# frozen_string_literal: true

require 'thor'


module Filer
  class CLI < Thor

    desc "hello [name]", "hello"
    def hello(name="")
      if name != ""
        puts "Hello #{name}"
      else
          puts "Hello Anon"
      end
    end

    desc "test_yield", "testing yield, args param used by yield block"
    def test_yield
      basepath = '.'
      smth = "*"
      args_for_block1 = {"method"=>"", "file_no"=>0}
      os_walk(basepath, smth, args_for_block1) {|f, args| puts "0...#{f}....#{args}"}
      os_walk(basepath, smth, args_for_block1) {|f, args| yield_method1(f, args)}
      # args_for_block = {"replace_char"=> replace_char, "new_var"=> "new_var"}
      args_for_block2 = {"method"=>"", "file_no"=>0}
      result = os_walk(basepath, smth, args_for_block2) {|f, args| yield_method2(f, args)}
      puts "result: #{result}"
    end
  end
end

