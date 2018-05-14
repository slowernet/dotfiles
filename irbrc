require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end
