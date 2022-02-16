
# takes dir path as input and returns list of formatted filepath (within dir or subdir)
def rename_image_filenames_for_valid_url(dirpath, replace_char)
  renames = Hash.new
  Dir.glob(File.join("**", "*.{jpg,jpeg,png}"), base: dirpath) { |f| rename_filename_for_valid_url(f, dirpath, replace_char, renames) }
  return renames
end

# formats file name
def rename_filename_for_valid_url(filepath, basepath, replace_char, renames)
  print "filepath: #{filepath}, basepath: #{basepath}\n"
  fullpath = "#{basepath}/#{filepath}"
  # print "fullpath: #{fullpath}\n"
  if File.file?(fullpath)
    fname = File.basename(filepath)
    dirpath = File.dirname(filepath)
    fname_chars = rename_char_array_for_valid_url(fname.chars, replace_char)
    fname_new = fname_chars.join.to_s
    if fname != fname_new
      if dirpath == '.'
        new_path = fname_new
      else
        new_path = "#{dirpath}/#{fname_new}"
      end
      new_fullpath = "#{basepath}/#{new_path}"
      #       File.rename(fullpath, new_fullpath)
      renames[fullpath] = "#{basepath}/#{new_path}"
      print "Rename:\n#{fullpath}  =>  #{basepath}/#{new_path}\n"
      print "dirpath: #{dirpath}\n"
    end
  else
    print "NOT A FILE!: #{fullpath}\n"
  end
end

# replaces continuous occurrence of non-[digit/letters/extra] chars with replace_char
def rename_char_array_for_valid_url(path_chars, replace_char)
  fpath_chars = []
  (0..path_chars.size - 1).each do |i|
    fpath_chars.append(rename_char_for_valid_url(i, path_chars, replace_char))
  end
  fpath_chars
end

def rename_char_for_valid_url(char_position, path_chars, replace_char)
  char = path_chars[char_position]
  if valid_url_char?(char)
    return char
  else
    # if first char or previous char is digit_or_letter? then replace char
    if char_position == 0 or valid_url_char?(path_chars[char_position-1])
      return replace_char
    end
  end
end

def valid_url_char?(char)
  valid_url_chars_set = ['-', '.', '_', '~', ':', '/', '?', '#', '[', ']', '@', '!', '$', '&', '(', ')', '*', '+', ',', ';', '%', '=', "'"].to_set
  point = char.ord
  if point >= 48 && point <= 57 # digit?
    return true
  elsif point >= 65 && point <= 90 # uppercase letter?
    return true
  elsif point >= 97 && point <= 122 # lowercase letter?
    return true
  elsif valid_url_chars_set === char
    return true
  end
  return false
end

