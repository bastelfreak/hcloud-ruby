module Hcloud
  class Server
    Attributes = {
      id: nil,
      name: nil,
      status: nil,
      created: :time,
      public_net: nil,
      server_type: ServerType,
      datacenter: Datacenter,
      image: Image,
      iso: nil,
      rescue_enabled: nil,
      locked: nil,
      backup_window: nil,
      outgoing_traffic: nil,
      ingoing_traffic: nil,
      included_traffic: nil
    }

    include EntryLoader

    def update(name:) 
      Server.new(
        Oj.load(request(base_path, j: {name: name}, method: :put).run.body)["server"],
        parent,
        client
      )
    end

    def destroy
      Action.new(
        Oj.load(request(base_path, method: :delete).run.body)["action"],
        parent,
        client
      )
    end
   
    %w(poweron poweroff shutdown reboot reset disable_rescue).each do |action|
      define_method(action) do
        Action.new(
          Oj.load(request(base_path("actions/#{action}"), method: :post).run.body)["action"],
          parent,
          client
        )
      end
    end

    def actions
      ActionResource.new(client: client, parent: self, base_path: base_path)
    end

    private

    def base_path(ext=nil)
      return ["servers/#{id}",ext].compact.join("/") unless id.nil?
      raise ResourcePathError, "Unable to build resource path. Id is nil." 
    end

  end
end
