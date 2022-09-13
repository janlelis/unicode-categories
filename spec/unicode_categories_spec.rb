require_relative "../lib/unicode/categories"
require "minitest/autorun"

describe Unicode::Categories do
  describe ".categories (alias .of)" do
    it "will always return an Array" do
      assert_equal [], Unicode::Categories.of("")
    end 

    it "will return all categories that characters in the string belong to" do
      assert_equal ["Lu", "Nd", "Zs"], Unicode::Categories.of("A 2")
    end 

    it "will return long identifiers for format: :long option" do
      assert_equal ["Decimal_Number", "Space_Separator", "Uppercase_Letter"],
          Unicode::Categories.of("A 2", format: :long)
    end 

    it "will return all categories sorted order" do
      assert_equal ["Lu", "Nd"], Unicode::Categories.of("A2")
      assert_equal ["Lu", "Nd"], Unicode::Categories.of("2A")
    end 

    if RUBY_ENGINE != "jruby"
      it "will call .category for every character" do
        mocked_method = MiniTest::Mock.new
        if RUBY_VERSION >= "2.7"
          mocked_method.expect :call, "first category",  ["A"]
          mocked_method.expect :call, "second category", ["2"]
        else
          mocked_method.expect :call, "first category",  ["A", {}]
          mocked_method.expect :call, "second category", ["2", {}]
        end

        Unicode::Categories.stub :category, mocked_method do
          Unicode::Categories.of("A2")
        end
        mocked_method.verify
      end
    end
  end

  describe ".category" do
    it "will return category for that character" do
      assert_equal "So", Unicode::Categories.category("�")
    end

    it "will return Cn for unassigned codepoints" do
      assert_equal "Cn", Unicode::Categories.category("\u{10c50}")
      assert_equal "Cn", Unicode::Categories.category("\u{e01f0}")
    end
  end

  describe ".names" do
    it "will return a list of all categories" do
      assert_kind_of Array, Unicode::Categories.names
      assert_includes Unicode::Categories.names, "Sc"
    end

    it "will return a list of all long category names when used with format: :long" do
      assert_kind_of Array, Unicode::Categories.names(format: :long)
      assert_includes Unicode::Categories.names(format: :long), "Currency_Symbol"
    end
  end
end

