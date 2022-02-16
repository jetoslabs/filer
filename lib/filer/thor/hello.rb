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
  end
end

