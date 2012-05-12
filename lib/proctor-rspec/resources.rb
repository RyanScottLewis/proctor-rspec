require 'proctor-rspec/ext/active_resource' # I hate that I have to see this =(

module ProctorRspec
  class Resource < ActiveResource::Base
    self.site = ProctorRspec.config.server.to_s
  end
  
  class Client < Resource; end
  class Project < Resource; end
  class Iteration < Resource; end
  class Example < Resource; end
  class ExampleGroup < Resource
    class << self
      def current_queue
        @current_queue ||= []
      end
      
      def current
        current_queue.last
      end
      
      def current?
        !current_queue.empty?
      end
      
      def drop_current
        current_queue.pop if current?
      end
    end
    
    after_create :add_to_current_queue
    
    private
    
    def add_to_current_queue
      self.class.current_queue << self
    end
  end
end
