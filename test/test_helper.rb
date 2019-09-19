$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "craps_dice"

require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!
