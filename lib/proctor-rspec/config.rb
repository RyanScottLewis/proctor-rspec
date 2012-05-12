module ProctorRspec
  class << self
    def client_id
      @client_id ||= Socket.gethostname
    end
    
    def config(&blk)
      @config ||= Config.new
      blk.call(@config) if block_given?
      
      @config
    end
    
    alias_method :configure, :config
  end
  
  class Config
    class Server < UniformResourceIdentifier; end
    
    attr_reader :project_name
    
    def initialize(&blk)
      blk.call(self) if block_given?
    end
    
    def project_name=(name)
      @project_name = name.to_s
    end
    
    def server
      @server ||= Server.parse('http://127.0.0.1:3000')
    end
    
    def server=(value)
      @server = Server.parse(value)
      p @server
      puts "=--=-=-==-"
      @server
    end
    
    def to_h
      { :project_name => project_name, :server => server.to_h }
    end
  end
end
