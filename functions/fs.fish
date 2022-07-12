#!/usr/bin/env fish

# Functions
function fs --description "Source output of script (fs = fish source)."
    if test -z $argv[1]
        echo "You need to specify command to execute."
        echo "USAGE: fs <command>"
        return 1
    end

    set -x IS_FISH_SOURCED true

    if ! type -q $argv[1]
        echo Command not found: $argv[1]
        return 1
    end

    if test -e /tmp/fsout
        rm /tmp/fsout
    end
    
    $argv > /tmp/fsout
    set -l exit_code $status

    if not test $exit_code -eq 0
        echo
        echo "Error: command $argv returned exit code $exit_code."

        if test -e /tmp/fsout
        and test -s /tmp/fsout
            echo Command output:
            cat /tmp/fsout
        end

        return $exit_code
    end

    source /tmp/fsout
end
