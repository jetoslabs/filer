
def rename_ext(basepath, curr_ext, next_ext)
  renames = Hash.new
  Dir.glob(File.join("**", "*.{#{curr_ext}}"), base: basepath) { |f| rename_filename_ext(f, basepath, curr_ext, next_ext, renames) }
  return renames
end

def rename_filename_ext(relative_filepath, basepath, curr_ext, new_ext, renames)
  fullpath = "#{basepath}/#{relative_filepath}"
  if File.file?(fullpath)
    fname = File.basename(relative_filepath)
    dirpath = File.dirname(relative_filepath)
    fname_new = fname.gsub(/#{curr_ext}/i, new_ext)
    # print(fname_new)
    if fname != fname_new
      if dirpath == '.'
        new_path = fname_new
      else
        new_path = "#{dirpath}/#{fname_new}"
      end
      new_fullpath = "#{basepath}/#{new_path}"
      print "Rename: #{fullpath}  =>  #{new_fullpath}\n"
      print "dirpath: #{dirpath}\n"
      File.rename(fullpath, new_fullpath)
      renames[fullpath] = new_fullpath
    end
  else
    print "NOT A FILE!: #{fullpath}\n"
  end
end
