unless RUBY_PLATFORM =~ /java/
  raise LoadError, 'Only supports JRuby'
end

require "asakra/version"
