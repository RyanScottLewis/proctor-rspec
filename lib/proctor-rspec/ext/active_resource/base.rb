module ActiveResource
  class Base
    include Callbacks
    
    def save
      run_callbacks :save do
        new? ? create : update
      end
    end
    
    def destroy
      run_callbacks :destroy do
        connection.delete(element_path, self.class.headers)
      end
    end
    
    def update
      run_callbacks :update do
        connection.put(element_path(prefix_options), encode, self.class.headers).tap do |response|
          load_attributes_from_response(response)
        end
      end
    end
    
    def create
      run_callbacks :create do
        connection.post(collection_path, encode, self.class.headers).tap do |response|
          self.id = id_from_response(response)
          load_attributes_from_response(response)
        end
      end
    end
  end
end