require 'guard'
require 'guard/guard'
require 'guard/watcher'

require 'sass'

module Guard
  class Sass < Guard
    def initialize(watchers=[], options={})
      super
      # init stuff here, thx!
    end

    # =================
    # = Guard methods =
    # =================

    # If one of those methods raise an exception, the Guard::GuardName instance
    # will be removed from the active guards.

    # Called once when Guard starts
    # Please override initialize method to init stuff
    def start
      Sass::Plugin.update_stylesheets
      true
    end

    # Called on Ctrl-C signal (when Guard quits)
    def stop
      true
    end

    # Called on Ctrl-Z signal
    # This method should be mainly used for "reload" (really!) actions like reloading passenger/spork/bundler/...
    def reload
      true
    end

    # Called on Ctrl-\ signal
    # This method should be principally used for long action like running all specs/tests/...
    def run_all
      Sass::Plugin.update_stylesheets
      true
    end

    # Called on file(s) modifications
    def run_on_change(paths)
      Sass::Plugin.update_stylesheets
      true
    end
  end
end
