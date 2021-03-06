require "hcloud/version"
require 'active_support/core_ext/object/to_query'

module Hcloud
  autoload :Error, 'hcloud/errors'
  autoload :Client, 'hcloud/client'
  autoload :AbstractResource, 'hcloud/abstract_resource'
  autoload :ServerResource, 'hcloud/server_resource'
  autoload :EntryLoader, 'hcloud/entry_loader'
  autoload :Server, 'hcloud/server'
  autoload :ServerType, 'hcloud/server_type'
  autoload :Datacenter, 'hcloud/datacenter'
  autoload :Location, 'hcloud/location'
  autoload :Image, 'hcloud/image'
  autoload :Action, 'hcloud/action'
  autoload :ActionResource, 'hcloud/action_resource'
end
