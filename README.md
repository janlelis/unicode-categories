# Unicode::Categories [![[version]](https://badge.fury.io/rb/unicode-categories.svg)](http://badge.fury.io/rb/unicode-categories)  [![[travis]](https://travis-ci.org/janlelis/unicode-categories.png)](https://travis-ci.org/janlelis/unicode-categories)

Returns which [General Categories](https://en.wikipedia.org/wiki/Unicode_character_property#General_Category) a Unicode string contains.

Unicode version: **8.0.0**

Supported Rubies: **2.3**, **2.2**, **2.1**

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
puts Unicode::Categories.names

# # # Output # # #

Cc
Cf
Cn
Co
Cs
LC
Ll
Lm
Lo
Lt
Lu
Mc
Me
Mn
Nd
Nl
No
Pc
Pd
Pe
Pf
Pi
Po
Ps
Sc
Sk
Sm
So
Zl
Zp
Zs
```

You get a list of long names with:

```ruby
require "unicode/categories"
puts Unicode::Categories.names(format: :long)

# # # Output # # #

Cased_Letter
Close_Punctuation
Connector_Punctuation
Control
Currency_Symbol
Dash_Punctuation
Decimal_Number
Enclosing_Mark
Final_Punctuation
Format
Initial_Punctuation
Letter_Number
Line_Separator
Lowercase_Letter
Math_Symbol
Modifier_Letter
Modifier_Symbol
Nonspacing_Mark
Open_Punctuation
Other_Letter
Other_Number
Other_Punctuation
Other_Symbol
Paragraph_Separator
Private_Use
Space_Separator
Spacing_Mark
Surrogate
Titlecase_Letter
Unassigned
Uppercase_Letter
```

## MIT License

- Copyright (C) 2016 Jan Lelis <http://janlelis.com>. Released under the MIT license.
- Unicode data: http://www.unicode.org/copyright.html#Exhibit1

