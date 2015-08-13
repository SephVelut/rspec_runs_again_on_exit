require 'bundler/setup'
require 'daemons'

class Test
  def spawn
    # fork returns twice, a pid for the parent and nil for the child, execution path is broken up into two lanes here
    if tmppid = safefork
      # parent process execution path
      # -----------------------------

      Process.waitpid(tmppid)
      return true
    else
      # child process execution path
      # -----------------------------
      
      # detach from tty
      # optional
      Process.setsid

      # this is where the child process exits and causes rspec to run/output expectation again
      exit if pid = safefork
      #second child process continues from here after the first child exits in the last statement

      # some code meant to be executed as a daemon
      loop do
        sleep 1
        File.open('/Users/seph/Desktop/a.txt', 'a') { |f| f.write("asd") }
      end

      exit
    end
  end

  def safefork
    if pid = fork
      return pid
    end
  end
end
