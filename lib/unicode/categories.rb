require_relative "categories/constants"

module Unicode
  module Categories
    def self.categories(string, **options)
      res = []
      string.each_char{ |char|
        category_name = category(char, **options)
        res << category_name unless res.include?(category_name)
      }   
      res.sort
    end 
    class << self; alias of categories; end 

    def self.category(char, format: :short)
      require_relative 'categories/index' unless defined? ::Unicode::Categories::INDEX
      codepoint_depth_offset = char.ord or
          raise(ArgumentError, "Unicode::Categories.category must be given a valid char")
      index_or_value = INDEX[:CATEGORIES]
      [0x10000, 0x1000, 0x100, 0x10].each{ |depth|
        index_or_value         = index_or_value[codepoint_depth_offset / depth]
        codepoint_depth_offset = codepoint_depth_offset % depth
        unless index_or_value.is_a? Array
          res = index_or_value || "Cn"
          return format == :long ? INDEX[:CATEGORY_NAMES][res] : res
        end
      }

      res = index_or_value[codepoint_depth_offset] || "Cn"
      format == :long ? INDEX[:CATEGORY_NAMES][res] : res
    end 

    def self.names(format: :short)
      require_relative 'categories/index' unless defined? ::Unicode::Categories::INDEX
      case format
      when :long
        INDEX[:CATEGORY_NAMES].values.sort
      when :short
        INDEX[:CATEGORY_NAMES].keys.sort
      when :table
        INDEX[:CATEGORY_NAMES].dup
      end
    end
  end
end
