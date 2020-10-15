# No greeting when starting an interactive shell.
function fish_greeting
end

set -x PATH $PATH $JAVA_HOME/bin

function mcc
        mvn clean compile
end

function mcv
        mvn clean verify
end

function mci
        mvn clean install
end