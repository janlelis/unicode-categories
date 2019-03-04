# Unicode::Categories [![[version]](https://badge.fury.io/rb/unicode-categories.svg)](https://badge.fury.io/rb/unicode-categories)  [![[travis]](https://travis-ci.org/janlelis/unicode-categories.png)](https://travis-ci.org/janlelis/unicode-categories)

Returns which [General Categories](https://en.wikipedia.org/wiki/Unicode_character_property#General_Category) a Unicode string contains.

Unicode version: **12.0.0**

Supported Rubies: **2.6**, **2.5**, **2.4**, **2.3**

Old Rubies that might still work: **2.2**, **2.1**, **2.0**

## Gemfile

```ruby
gem "unicode-categories"
```

## Usage

```ruby
require "unicode/categories"

# All general categories of a string
Unicode::Categories.categories("A 2") # => ["Lu", "Nd", "Zs"]
Unicode::Categories.categories("A 2", format: :long)
# => ["Decimal_Number", "Space_Separator", "Uppercase_Letter"]

# Also aliased as .of
Unicode::Categories.of("\u{10c50}") # => ["Cn"]

# Single character
Unicode::Categories.category("☼", format: :long) # => "Other_Symbol"
```

The list of categories is always sorted alphabetically.

## Hints

### Regex Matching

If you have a string and want to match a substring/character from a specific Unicode block, you actually won't need this gem. Instead, you can use the [Regexp Unicode Property Syntax `\p{}`](http://ruby-doc.org/core-2.3.0/Regexp.html#class-Regexp-label-Character+Properties):

```ruby
"Find decimal numbers (like 2 or 3) within a string".scan(/\p{Nd}+/) # => ["2", "3"]
```

### List of General Categories

You can retrieve a list of all General Categories like this:

```ruby
require "unicode/categories"
puts \
  "Short | Long\n" +
  "------|-----\n" +
  Unicode::Categories.names(format: :table).to_a.map{ |r| "   %s | %s" % r }.join("\n")
```

Short | Long
------|-----
   Cc | Control
   Cf | Format
   Cn | Unassigned
   Co | Private_Use
   Cs | Surrogate
   LC | Cased_Letter
   Ll | Lowercase_Letter
   Lm | Modifier_Letter
   Lo | Other_Letter
   Lt | Titlecase_Letter
   Lu | Uppercase_Letter
   Mc | Spacing_Mark
   Me | Enclosing_Mark
   Mn | Nonspacing_Mark
   Nd | Decimal_Number
   Nl | Letter_Number
   No | Other_Number
   Pc | Connector_Punctuation
   Pd | Dash_Punctuation
   Pe | Close_Punctuation
   Pf | Final_Punctuation
   Pi | Initial_Punctuation
   Po | Other_Punctuation
   Ps | Open_Punctuation
   Sc | Currency_Symbol
   Sk | Modifier_Symbol
   Sm | Math_Symbol
   So | Other_Symbol
   Zl | Line_Separator
   Zp | Paragraph_Separator
   Zs | Space_Separator

See [unicode-x](https://github.com/janlelis/unicode-x) for more Unicode related micro libraries.

## MIT License

- Copyright (C) 2016-2019 Jan Lelis <http://janlelis.com>. Released under the MIT license.
- Unicode data: http://www.unicode.org/copyright.html#Exhibit1

