# This is top level method used in yield block (called by controllers/os_walk: yield stmt)
# rename file ext
def yield_method_rename_ext(f, args)
  curr_ext = args["curr_ext"]
  new_ext = args["new_ext"]
  output = args["output"]
  if File.file?(f)
    fname = File.basename(f)
    dirpath = File.dirname(f)
    fname_new = fname.gsub(/#{curr_ext}/i, new_ext)
    if fname != fname_new
      new_filepath = "#{dirpath}/#{fname_new}"
      # File.rename(f, new_path)
      args["output"][f] = "#{new_filepath}"
    end
  else
    print "NOT A FILE!: #{f}\n"
  end
end
