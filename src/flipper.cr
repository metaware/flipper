require "./flipper/*"

class Flipper
  class AdapterNotSet < Exception
  end

  def self.adapter=(adapter : Kiwi::Store)
    @@adapter = adapter
  end

  def self.adapter
    raise Flipper::AdapterNotSet.new unless @@adapter
    @@adapter
  end

  def self.enable(feature)
    adapter.try do |adapter|
      adapter.set(feature.to_s, "true") == "true"
    end
  end

  def self.disable(feature)
    adapter.try do |adapter|
      adapter.set(feature.to_s, "false") == "false"
    end
  end

  def self.enabled?(feature)
    adapter.try do |adapter|
      stored_value = adapter.get(feature.to_s)
      if stored_value.nil? || stored_value == "false"
        false
      elsif stored_value == "true"
        true
      end
    end
  end

  def self.disabled?(feature)
    !enabled?(feature)
  end
end
