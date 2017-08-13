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

  describe Flipper do
    context "#enable" do
      it "should enable a feature" do
        flipper = Flipper.new(adapter)
        flipper.enable(:search).should be_true
      end
    end

    context "#disable" do
      it "should disable a feature" do
        flipper = Flipper.new(adapter)
        flipper.disable(:search).should be_true
      end
    end

    context "#enabled?" do
      it "should check if a feature is enabled?" do
        flipper = Flipper.new(adapter)
        flipper.enable(:search)
        flipper.enabled?(:search).should be_true
        flipper.disabled?(:search).should be_false
      end

      it "should return false for a non-existent feature" do
        flipper = Flipper.new(adapter)
        flipper.enabled?(:non_existent_feature).should be_false
        flipper.disabled?(:non_existent_feature).should be_true
      end
    end

    context "#disabled?" do
      it "should check if a feature is disabled?" do
        flipper = Flipper.new(adapter)
        flipper.disable(:search)
        flipper.enabled?(:search).should be_false
        flipper.disabled?(:search).should be_true
      end

      it "should return true for a non-existent feature" do
        flipper = Flipper.new(adapter)
        flipper.enabled?(:non_existent_feature).should be_false
        flipper.disabled?(:non_existent_feature).should be_true
      end
    end
  end
end
