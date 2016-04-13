require_relative "../categories"

class String
  # Optional string extension for your convenience
  def unicode_categories
    Unicode::Categories.of(self)
  end
end
