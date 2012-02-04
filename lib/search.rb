module Search
  def engine=(value)
    @engine = value
  end
  
  def engine; @engine; end
  
  def self.included(base)
    base.class_eval do
      Search.engine = Search::Find #Dystopia
      
      get '/__search' do
        @path = ROOT + params[:path].to_s
        s_time = Time.now.to_f
        @found = Search.engine.find_in_folder(ROOT, @path, params[:q])
        @total_time = Time.now.to_f - s_time
        
        haml view(:search)
      end
      
      get '/__view' do
        if !`file "#{ROOT.join(params[:file])}"`.index('text')
          redirect params[:file]
          return
        end
        @content = ROOT.join(params[:file]).read
        haml view(:view)
      end
    end
  end
end

require GEM_ROOT + "lib/search/find"
require GEM_ROOT + "lib/search/dystopia"