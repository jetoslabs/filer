# frozen_string_literal: true
# require 'filer'
require 'thor'

require_relative "filer/version"
require_relative 'filer/thor/hello'
require_relative 'filer/thor/rename'

module Filer
  # class Error < StandardError; end
  class CLI < Thor
  end
end

Filer::CLI.start(ARGV)