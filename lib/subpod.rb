require 'colored'
require 'cocoapods'
require 'subpod/version'
require 'subpod/overloads'

module SubPod
  module Delegate
    module_function

    def install
      cfg = Pod::Config.instance
      cfg.podfile or fail Pod::Informative, "No `Podfile` found in the current working directory."
      installer = Installer.new(cfg.sandbox, cfg.podfile, cfg.lockfile)
      installer.update_mode = false
      installer.install!
    end
  end

  module_function

  def run cmd
    Delegate.send cmd
  rescue StandardError => e
    puts e.message
  rescue Exception => e
  end
end
