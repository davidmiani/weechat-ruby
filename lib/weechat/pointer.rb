module Weechat
  module Pointer
    module ClassMethods
      def from_ptr(ptr)
        o = allocate
        o.instance_variable_set(:@ptr, ptr)
        o
      end
    end

    def self.included(by)
      by.extend Weechat::Pointer::ClassMethods
    end

    attr_reader :ptr
    alias_method :pointer, :ptr

    def to_s
      @ptr
    end

    def ==(other)
      other.respond_to?(:ptr) and @ptr == other.ptr
    end
    alias_method :eql?, "=="
    alias_method :equal?, "=="

    def hash
      @ptr.hash
    end

    def inspect
      sprintf "#<%s:0x%x @ptr=%p>", self.class, object_id << 1, @ptr
    end
  end
end
