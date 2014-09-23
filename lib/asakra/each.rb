
require 'asakra/plugin_accessor'
require 'asakra/log_for_fluentd'

module Asakra
  class Each

    def initialize(hostname, judge)
      @hostname = hostname
      @judge = judge
    end

    def run
      # 1.get metrics every host
      # 2.output json for fluentd tail-input
      # 3.judge each host's statement with esper

      # 1.get metrics
      plugin = Asakra::PluginAccessor.new()
      metrics = plugin.getHash(@hostname)

      # 2. output json
      log = Asakra::FileLogger.new()
      log.run(metrics)

      # 3.judge with esper
      # jugde.getEPSeatvice
      @judge.send(metrics)
    end
  end
end
