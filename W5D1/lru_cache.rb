class LRUCache
    def initialize(cache_max)
      @cache_max = cache_max
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      cache.size 
    end

    def add(el)
      # adds element to cache according to LRU principle

    end

    def show
      # shows the items in the cache, with the LRU item first
      p cache 
    end

    private
    attr_reader :cache, :cache_max
    # helper methods go here!

  end