require "spec"
require "../src/flipper"

require "redis"
require "memcached"

require "kiwi/memory_store"
require "kiwi/file_store"
require "kiwi/redis_store"
require "kiwi/memcached_store"

macro works_as_expected_with(store)
  adapter = {{store}}
  Flipper.adapter = adapter

  describe Flipper do

    context ".adapter" do

      it "can be read back" do
        Flipper.adapter.should_not be_nil
      end

      it "should be Kiwi::Store" do
        Flipper.adapter.should be_a(Kiwi::Store)
      end

    end

    context ".enable" do
      it "should enable a feature" do
        Flipper.enable(:search).should be_true
      end
    end

    context ".disable" do
      it "should disable a feature" do
        Flipper.disable(:search).should be_true
      end
    end

    context ".enabled?" do
      it "should check if a feature is enabled?" do
        Flipper.enable(:search)
        Flipper.enabled?(:search).should be_true
        Flipper.disabled?(:search).should be_false
      end

      it "should return false for a non-existent feature" do
        Flipper.enabled?(:non_existent_feature).should be_false
        Flipper.disabled?(:non_existent_feature).should be_true
      end
    end

    context ".disabled?" do
      it "should check if a feature is disabled?" do
        Flipper.disable(:search)
        Flipper.enabled?(:search).should be_false
        Flipper.disabled?(:search).should be_true
      end

      it "should return true for a non-existent feature" do
        Flipper.enabled?(:non_existent_feature).should be_false
        Flipper.disabled?(:non_existent_feature).should be_true
      end
    end
  end
end
