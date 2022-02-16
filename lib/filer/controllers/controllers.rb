require_relative 'rename_filename'
require_relative 'rename_ext'


def os_walk(basepath, smth, args)
  Dir.glob(File.join("**", smth), base: basepath) do |f|
    yield f, args
  end
end


def yield_method1(f, args)
  puts "1... #{f} #{args}"
end

def yield_method2(f, args)
  puts "2... #{f} #{args}"
end