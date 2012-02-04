module Search::Find
  extend self
  CMD = "find . -type d \\( -name '*.git*' \\) -prune -o -exec file -F '&' {} \\; | grep text | cut -d\\& -f1 | sed 's/./\\\\&/g' | xargs -n 1 grep -i -l '###'"
  CMD_LIST = "find . -type d \\( -name '*.git*' \\) -prune -o -print | grep -i '###'"
  
  def find_in_folder(root, path, needle)
    in_filenames  = `cd #{path} && #{CMD_LIST.sub('###', needle)}`.split("\n")
    in_text_files = `cd #{path} && #{CMD.sub('###', needle)}`.split("\n")
    
    (in_filenames + in_text_files.select {|f| !in_filenames.include?(f) }).map {|f| f.sub('./', '') }
  end
  
  #def find_in_file(file, needle)
  #  `cat #{file} | grep -n -B 1 -A 1 '#{needle}'`
  #end
end