require_relative 'controller_rename_filename'
require_relative 'controller_rename_ext'


def os_walk(basepath, smth, args)
  Dir.glob(File.join("**", smth), base: basepath) do |relative_filepath|
    filepath = "#{basepath}/#{relative_filepath}"
    # filepath is given by os_walk, args is received by os_walk (yielded block should know what to do with args)
    yield filepath, args
  end
  args
end

def yield_method1(f, args)
  args["method"] = "yield_method1"
  puts "1... #{f} #{args}"
  args
end

def yield_method2(f, args)
  args["file_no"] = args["file_no"] + 1
  args["method"] = "yield_method2"
  puts "2... #{f} #{args}"
  args
end