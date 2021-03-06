module Hcloud
  class Action
    Attributes = {
      id: nil,
      command: nil,
      status: nil,
      progress: nil,
      started: :time,
      finished: :time,
      resources: nil,
      error: nil,
    }
    
    include EntryLoader
  end
end
