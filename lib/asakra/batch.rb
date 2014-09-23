require 'thread'
require 'asakra/each'
require 'asakra/judge'

module Asakra
  class Batch
    def start
      agentsFile = open("setting/agents.txt")
      agentsList = []
      agentsFile.each {|e|
        agentsList.push(e)
      }

      myListener = Asakra::MyListener.new()
      judge = Asakra::Judge.new(myListener)
      judge.setting

      m = Mutex.new
      ts = []
      ts << Thread.start {
        m.synchronize {
          for e in agentsList
            each = Asakra::Each.new(e, judge)
            each.run
            sleep rand * 0.1
          end

        }
      }

      ts.each {|t| t.join }
    end
  end
end
