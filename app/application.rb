require 'pry'
class Application 
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)

            search_term = req.path.split("/").last
            #binding.pry
            item = Item.all.find do |item|
                item.name == (search_term)
                #search_term = item
                end
                binding.pry
                if item
                    resp.write  item.price
                    
                 else 
                    binding.pry
                resp.write "Item not found"
                resp.status = 404
                end
                
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end


end