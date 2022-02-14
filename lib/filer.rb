# frozen_string_literal: true
require 'filer'
require 'thor'

require_relative "filer/version"
require_relative "filer/rename"

module Filer
  # class Error < StandardError; end
  class CLI < Thor
    desc "hello [name]", "say my name"
    def hello(name)
      hello1(name)
    end
  end
end

Filer::CLI.start(ARGV)