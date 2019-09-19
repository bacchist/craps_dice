require "yaml"
require "craps_dice/version"

ROLL_NAMES = YAML.load(File.read(File.expand_path("../yaml/roll.yml", __FILE__)))

class Roll < Array
  def initialize
	  2.times { push(rand(1..6)) }
  end

  def reroll
    clear
	  2.times { push(rand(1..6)) }
    self
  end

  def is_hard?
    uniq.length == 1
  end

  def is_seven?
    sum == 7
  end

  def name
    ROLL_NAMES.find { |key, values|
      values.include?(self.sort)
    }.first
  end

  def dup
    Marshal.load(Marshal.dump(self))
  end
end
