#!/usr/bin/env fish

# Functions
function fs --description "Source output of script (fs = fish source)."
    if test -z $argv[1]
        echo "You need to specify command to execute."
        echo "USAGE: fs <command>"
        return 1
    end

    set -x IS_FISH_SOURCED true

    if ! type -q $argv
        echo Command not found: $argv
        return 1
    end

    rm /tmp/fsout
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
