require 'java'
require 'esper-4.5.0.jar'
require 'esper/commons-logging-1.1.1.jar'
require 'esper/antlr-runtime-3.2.jar'
require 'esper/cglib-nodep-2.2.jar'
require 'pp'

module Asakra
  # Create a listener object when matched
  class MyListener
    include com.espertech.esper.client.UpdateListener

    def update(newEvents, oldEvents)
      puts "matched: "
      newEvents.each do |event|
        puts "- " + event.getUnderlying.inspect
      end
    end
  end

  class Judge

    def initialize(listener)
      @listener = listener
      @ep_service = com.espertech.esper.client.EPServiceProviderManager.getDefaultProvider
    end

    def setting
    # And the configuration
      ep_config = @ep_service.getEPAdministrator.getConfiguration

    # event（POJO when using java）
    # Prepare the OrderEvent type
      order_event_type = {
          "pluginId" => "string",
          "retryCount" => "double"
      }
      ep_config.addEventType("OrderEvent", order_event_type)

    # EPLの設定
    # Create EPL expression
    #   expression = "select * from OrderEvent where cast(retryCount,double) > 1"
      expression = "select * from OrderEvent where cast(retryCount,double) > 1"
    #expression = "select avg(price) from OrderEvent"
      statement = @ep_service.getEPAdministrator.createEPL(expression)

    # Register listener to statement
    #   listener = Asakra::MyListener.new
      statement.addListener(@listener)
    end

    def send(metrics)

    # send event to listner
      epr_runtime = @ep_service.getEPRuntime
      epr_runtime.sendEvent(metrics, "OrderEvent")

    end
  end
end