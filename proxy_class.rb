class Proxy
  attr_reader :messages

  def initialize(target_object)
    @object = target_object
    @messages = []
  end

  def method_missing(method_name, *args, &block)
    @messages << method_name
    @object.send(method_name, *args, &block)
  end

  def called?(method_name)
    @messages.include?(method_name) ? true : false
  end

  def number_of_times_called(method_name)
    @messages.count(method_name)
  end
end


class Television
  attr_accessor :channel

  def power
    if @power == :on
      @power = :off
    else
      @power = :on
    end
  end

  def on?
    @power == :on
  end
end