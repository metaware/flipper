require "./flipper/*"

class Flipper
  def initialize(@adapter : Kiwi::Store)
  end

  def enable(feature)
    @adapter.set(feature.to_s, "true") == "true"
  end

  def disable(feature)
    @adapter.set(feature.to_s, "false") == "false"
  end

  def enabled?(feature)
    stored_value = @adapter.get(feature.to_s)
    if stored_value.nil? || stored_value == "false"
      false
    elsif stored_value == "true"
      true
    end
  end

  def disabled?(feature)
    !enabled?(feature)
  end
end
