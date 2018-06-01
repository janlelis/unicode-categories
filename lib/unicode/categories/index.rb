require "zlib"
require_relative "constants"

module Unicode
  module Categories
    File.open(INDEX_FILENAME, "rb") do |file|
      serialized_data = Zlib::GzipReader.new(file).read
      serialized_data.force_encoding Encoding::BINARY
      INDEX = Marshal.load(serialized_data)
    end
  end
end
