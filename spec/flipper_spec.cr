require "./spec_helper"

describe Flipper do
  it "attempting to use flipper without adapter raise error" do
    expect_raises(Flipper::AdapterNotSet) do
      Flipper.enable(:search)
    end
  end

  it "works as expected with MemoryStore" do
    works_as_expected_with(Kiwi::MemoryStore.new)
  end

  it "works as expected with FileStore" do
    works_as_expected_with(Kiwi::FileStore.new("/tmp/kiwi"))
  end

  it "works as expected with RedisStore" do
    works_as_expected_with(Kiwi::RedisStore.new(Redis.new))
  end

  it "works as expected with MemcachedStore" do
    works_as_expected_with(Kiwi::MemcachedStore.new(Memcached::Client.new))
  end
end
