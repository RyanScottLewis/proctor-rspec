module ProctorRspec
  class Formatter < RSpec::Core::Formatters::BaseFormatter
    def start(example_count)
      # TODO: Status check here... simple POST request to /status should return 200 or 404
      
      @client = Client.find(:first, :params => { :client => { :name => ProctorRspec.client_id } }) rescue nil
      @client = Client.create(:name => ProctorRspec.client_id) if @client.nil?
      
      @project = Project.find(:first, :params => { :project => { :name => ProctorRspec.config.project_name, :client_id => @client.id } }) rescue nil
      @project = Project.create(:name => ProctorRspec.config.project_name, :client_id => @client.id) if @project.nil?
      
      @iteration = Iteration.create(:project_id => @project.id, :example_count => example_count)
    end
    
    def example_group_started(example_group)
      create_example_group(example_group)
    end
    
    def example_group_finished(example_group)
      ExampleGroup.drop_current
    end
    
    # TODO - Involves adding an instance method to the example instance that returns the example resource
    #        so we can update them when that pass/fail instead of creating new ones,
    #        allowing us to more accurately show the running iteration
    # def example_started(example); create_example(example, :unknown); end
    
    def example_passed(example)
      create_example(example, :passing)
    end
    
    def example_pending(example)
      create_example(example, :pending)
    end
    
    def example_failed(example)
      create_example(example, :failing)
    end
    
    private
    
    def example_group_to_hash(example_group)
      {
        :description      => example_group.metadata[:example_group][:description_args].collect(&:to_s).join(' '),
        :example_group_id => ExampleGroup.current? ? ExampleGroup.current.id : nil,
        :iteration_id     => ExampleGroup.current? ? nil : @iteration.id
      }
    end
    
    def example_to_hash(example, state)
      {
        :started_at       => example.metadata[:execution_result][:started_at],
        :finished_at      => example.metadata[:execution_result][:finished_at],
        :run_time         => example.metadata[:execution_result][:run_time],
        :file_path        => example.metadata[:file_path],
        :line_number      => example.metadata[:line_number],
        :description      => example.metadata[:description],
        :state            => state,
        :example_group_id => ExampleGroup.current? ? ExampleGroup.current.id : nil,
        :iteration_id     => ExampleGroup.current? ? nil : @iteration.id
      }
    end
    
    def create_example_group(example_group)
      ExampleGroup.create( example_group_to_hash(example_group) )
    end
    
    def create_example(example, state)
      Example.create( example_to_hash(example, state) )
    end
  end
end
