# This is top level method used in yield block (called by controllers/os_walk: yield stmt)
# rename file name for valid url
def yield_method_rename_filename_for_valid_url(f, args)
  replace_char = args["replace_char"]
  if File.file?(f)
    # print "fullpath: #{f}\n"
    fname = File.basename(f)
    dirpath = File.dirname(f)
    fname_chars = rename_char_array_for_valid_url(fname.chars, replace_char)
    fname_new = fname_chars.join.to_s
    if fname != fname_new
      new_filepath = "#{dirpath}/#{fname_new}"
      #       File.rename(f, new_filepath)
      args["output"][f] = "#{new_filepath}"
    end
  else
    print "NOT A FILE!: #{f}\n"
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

