module Cloak
  class List
    ##
    # List Path
    attr_reader :path

    ##
    # Entries Array
    attr_accessor :entries

    def initialize
      @path = File.expand_path('~/.cloak')
      @entries = []
      load rescue save 
    end
    
    ##
    # Append entries to the array
    def add(entry)
      @entries << entry
    end
    alias :<< :add

    ##
    # Save all entries to the specified path
    def save
      set_entry_encoding
      File.open(path, "wb") do |file|
        file.write YAML.dump(entries)
      end
      self
    end

    ##
    #  Load the all entries into the array
    def load
      @entries = YAML.load_file path
      @entries = [] if !@entries
      self
    end

    private
    
    def set_entry_encoding
      @entries.each do |e|
        e.password.force_encoding("BINARY")
      end
    end
  
  end
end
