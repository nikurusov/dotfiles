if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias n="nvim"

# set -x JAVA_HOME /Users/n.urusov/Library/Java/JavaVirtualMachines/zulu-17
set -x JAVA_HOME /Users/n.urusov/Library/Java/JavaVirtualMachines/graalvm-jdk-23.0.2+7.1/Contents/Home

#
# set -x JAVA_HOME /Users/n.urusov/Library/Java/JavaVirtualMachines/graalvm-jdk-23.0.2+7.1/Contents/Home
# set -x JAVA_HOME /Users/n.urusov/Library/Java/JavaVirtualMachines/graalvm-ce-17.0.9/Contents/Home
set -x PATH $JAVA_HOME/bin $PATH
set -x EDITOR "nvim"

fish_add_path "/opt/homebrew/bin/"
fish_add_path "/opt/homebrew/opt/ruby/bin"
fish_add_path "/opt/homebrew/lib/ruby/gems/3.4.0/bin"
fish_add_path "/Users/n.urusov/.opam/default/bin"
