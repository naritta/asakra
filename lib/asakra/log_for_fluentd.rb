require 'logger'

module Asakra
  # output into log file for fluentd tail-input plugin
  class FileLogger
    def run(mes)
      log = Logger.new("for-fluentd.log")

      # log.debug(mes)
      log.info(mes)
      # log.warn("This is warning message")
    end
  end
end