# frozen_string_literal: true
# require 'filer'
require 'thor'

require_relative "filer/version"
require_relative 'filer/hello'
require_relative 'filer/rename'

module Filer
  # class Error < StandardError; end
  class CLI < Thor
  end
end

Filer::CLI.start(ARGV)