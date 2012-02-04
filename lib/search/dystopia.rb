# coding: utf-8

require 'rufus/tokyo/dystopia'
require 'digest'

=begin
  A B : searches for records including the two tokens.
  A && B : searches for records including the two tokens.
  A || B : searches for records including the one or both of the two tokens.
  "A B..." : searches for records including the phrase.
  [[A]] : searches for records including words exactly matching the token.
  [[A*]] : searches for records including words beginning with the token.
  [[*A]] : searches for records including words ending with the token.
  [[[[A : searches for records beginning with the token.
  A]]]] : searches for records ending with the token.
  Note that the priority of "||" is higher than the one of "&&".
=end

module Search::Dystopia
  extend self
  
  CMD = "find . -type d \\( -name '*.git*' \\) -prune -o -print"
  
  def find_in_folder(root, path, needle)
    files = inst.search(needle).map do |id|
      doc = inst.fetch(id)
      doc[0, doc.index("\n")]
    end
    
    if path != root
      subdir = path.to_s.sub(root.to_s + '/', '')
      files.select {|f| f[0, subdir.size] == subdir }.map {|f| f.sub(subdir + '/', '') }
    else
      files
    end
  end
  
  # return instance of searcher. and make indexing on first search
  def inst
    return @inst if @inst
    db_file = "/tmp/httpit_index_#{Digest::MD5.hexdigest ROOT.to_s}"
    @inst ||= Rufus::Tokyo::Dystopia::Core.new(db_file)
    at_exit{ puts("removing #{db_file}"); `rm -r "#{db_file}"` }
    index_dir()
    @inst
  end
  
  def index_dir()
    files = `cd #{ROOT.to_s} && #{CMD}`.split("\n")
    inst.clear
    
    puts "Indexing #{files.size} files"
    files.each_with_index do |file, i|
      next if file[0, 3] == './.'
      
      # if its a text file store its content
      content = if `file "#{ROOT.join(file).to_s}"`.index('text')
        (ROOT + file).read
      else ""; end
      inst.store(i, file.sub('./', '') + "\n" + content)
    end
    
    inst
  end
end