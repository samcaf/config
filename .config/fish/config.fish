# ============================
# Variables:
# ============================
# ------------------------
# Misc environment vars
# ------------------------
set EDITOR "vim"
export EDITOR

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

alias cpg="cpg -g"
alias mvg="mvg -g"

# Git for dot files
alias config='/usr/bin/git --git-dir=/Users/sam/.cfg/ --work-tree=/Users/sam'


# ------------------------
# $PATH (and $PYTHONPATH):
# ------------------------
# Notes:
# PATH is used for the shell to be able to find/resolving/calling
# executables without using the full path.

# PYTHONPATH is used to find module imports in Python, and is one of the
# things used by Python in setting sys.path when the interpreter starts.
# When searching for modules, Python will first look in PATH and then in
# PYTHONPATH.

# - - - - - - - - - - - -
# My research directories ==> PATH
# - - - - - - - - - - - -
fish_add_path --path /Users/sam/Documents/Research/EWOCs
fish_add_path --path /Users/sam/Documents/Research/JetMonteCarlo
fish_add_path --path /Users/sam/Documents/Research/Thermalization
fish_add_path --path /Users/sam/Documents/Research/Ising

# - - - - - - - - - - - -
# My research directories ==> PYTHONPATH
# - - - - - - - - - - - -
# Setting PYTHONPATH using the research directories in the PATH
set PYTHONPATH "/Users/sam/Documents/Research/JetMonteCarlo:$PYTHONPATH"
set PYTHONPATH "/Users/sam/Documents/Research/EWOCs:$PYTHONPATH"
# set PYTHONPATH "[XXX]:$PYTHONPATH"
export PYTHONPATH

# - - - - - - - - - - - -
# Pythia directories ==> PATH
# - - - - - - - - - - - -
fish_add_path --path /Users/sam/Documents/Software/pythia8307
fish_add_path --path /Users/sam/Documents/Software/pythia8307/bin
# Python path: See the 2022 Pythia manual
# https://pythia.org/download/pdf/pythia8300.pdf#page=257
# Not working for me now but maybe someday
fish_add_path --path /Users/sam/Documents/Software/pythia8307/lib

# - - - - - - - - - - - -
# MacPorts Path ==> PATH
# - - - - - - - - - - - -
set PATH "/opt/local/bin:/opt/local/sbin:$PATH"


# ------------------------
# Pythia Paths
# ------------------------
# Modifying path variables for usage of Pythia
set PYTHIA8PATH "/Users/sam/Documents/Software/pythia8307"
set PYTHIA8DATA "$PYTHIA8PATH/share/Pythia8/xmldoc"
set LD_LIBRARY_PATH "$PYTHIA8PATH/lib:$LD_LIBRARY_PATH"
set DYLD_LIBRARY_PATH "$PYTHIA8PATH/lib:$DYLD_LIBRARY_PATH"
set C_INCLUDE_PATH "$PYTHIA8PATH/include:$C_INCLUDE_PATH"
set CPLUS_INCLUDE_PATH "$PYTHIA8PATH/include:$CPLUS_INCLUDE_PATH"


# ------------------------
# Other Paths
# ------------------------
# MadGraph5
set MG5Path "/Users/sam/Documents/Software/MG5_aMC_v3_5_0"
export MG5Path


# ============================
# Aliases:
# ============================
alias update_shutdown="sudo sh -c 'softwareupdate -i -a; shutdown -h now'"
alias fishrc="vim ~/.config/fish/config.fish"
alias vimrc="vim ~/.vimrc"
alias tx="tmuxinator"

# Open URL for current GitHub repository:
alias g-open="bash -c 'source ~/.bash_profile; g-open'"

# ------------------------
# TeX, Tech, etc.
# ------------------------
alias texstuff="open ~/Library/texmf"
alias texstuff_samaf="vim ~/Library/texmf/tex/latex/samaf.sty"
alias texsty="vim ~/Library/texmf/tex/latex/samaf.sty"
alias samstuff="chrome https://docs.google.com/spreadsheets/d/1OXVp6Cn3BJ9WMQ01AAKi6byxzFFxCIqOEvUPjbbtyNQ/edit#gid=0"
alias rocketbook="chrome https://www.dropbox.com/work/RocketBook"

# Short command to compile latex document with all comments added to the front of the file,
# if the latex functions required to do so exist in the current directory
function full_tex_compile
    sed -i '' -e "s/storecommentsfalse/storecommentstrue/" ./includes/utils/comments.tex
    pdflatex $argv &&
    bibtex $argv &&
    sed -i '' -e "s/storecommentstrue/storecommentsfalse/" ./includes/utils/comments.tex
    pdflatex $argv
end

# Example tex-diff:
# latexdiff --append-context2cmd="abstract" piranha_May26preJesse.tex piranha.tex > piranha_diff_5-26_1.tex

# EFT Course
set eft_key ~/.ssh/id_rsa
alias eft-git-dir="cd ~/Dropbox/Backup_Files/Physics/Classes/MIT/EFT/"
alias eft-git="set GIT_SSH_COMMAND 'ssh -i "$eft_key" git'"

# ArXiv
alias arxiv-today="cd ~/Documents/Fun/arXiv_text_to_speech; python3 arXiv_text_to_speech.py"

# Mathematica and related tools
alias wolfscript="wolframscript -script"
alias feyncalc_examples="cd ~/Library/Mathematica/Applications/FeynCalc/Examples"

# ChatGPT Command Line Interface
set OPENAI_API_KEY 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

# ++++++++++++++++++
# Journals
# ++++++++++++++++++
# Physics
alias journal="cd /Users/sam/Dropbox\ \(MIT\)/Logs/Physics_Diary"

alias journal_today="journal; ./make_entry.sh"

alias journal_main="cd /Users/sam/Dropbox (MIT)/Logs/Physics_Diary; vim main.tex"
alias open_journal="journal_main"

alias journal_setup="journal; ./make_entry.sh -d +1"
alias journal_tomorrow="journal_setup"

# ------------------------
# Research
# ------------------------
alias grepv="grep -r --exclude-dir venv"

# ++++++++++++++++++
# Thesis
# ++++++++++++++++++
alias thesis="cd /Users/sam/Dropbox\ \(MIT\)/Thesis; vim thesis.tex"

# ++++++++++++++++++
# General
# ++++++++++++++++++
alias mg5="cd $MG5Path; ./bin/mg5_aMC"

# ++++++++++++++++++
# Dressed Observables for Bound States in Gauge Theories
# ++++++++++++++++++
alias dressed_overleaf="cd /Users/sam/Dropbox\ \(MIT\)/DressedOperators/64832e5e0fe61ede36473a50/Paper_Template"

# ++++++++++++++++++
# EWOCs
# ++++++++++++++++++
alias ewoc_code="cd /Users/sam/Documents/Research/LFM_EWOCs"

# ++++++++++++++++++
# Muon Beam Dump
# ++++++++++++++++++
alias beamdump_feyncalc="open ~/Documents/Research/MuonBeamDump/BeamDump_FeynCalc.nb"
alias beamdump_log="open ~/Documents/Research/MuonBeamDump/Egregious_Log.nb"


# ++++++++++++++++++
# Supercloud
# ++++++++++++++++++
set sc_key ~/.ssh/id_rsa

alias supercloud="ssh -i "$sc_key" sfard@txe1-login.mit.edu"
alias supercloud-portal="chrome https://txe1-portal.mit.edu/"

# PIRANHA Specific:
alias supercloud-jet-portal="chrome https://txe1-portal.mit.edu/gridsan/sfard/Projects/JetMonteCarlo/"

# ++++++++++++++++++
# Opendata: PIRANHA
# ++++++++++++++++++
set od_key ~/.ssh/id_opendata

function ssh-od
    ssh -i $od_key opendata@opendata1.mit.edu
end

function od-htop
    ssh -i $od_key opendata@opendata1.mit.edu -t htop
end

# Juptyer notebooks on opendata1.mit.edu

function od-open
    # ssh to access an existing remote nb server on local server
    ssh  -i $od_key -N -f -L 'localhost:5555:localhost:8888' 'opendata@opendata1.mit.edu' &&
    # chrome 'http://localhost:5555/tree?' &&
    echo 'Locally accessed opendata notebook server at port 5555'
end

function od-kill
    # Kill the process in the port at which we opened the remote nb
    lsof -ti:5555 | xargs kill &&
    echo 'Killed process at port 5555 for opendata notebook server'
end

function od-reset
    # Reset the port and ssh to od server
    od-kill && od-open
end

function od-responses
    # ssh and open up the Dropbox%20(MIT)/Research/SafeDrop/python/Responses_Section folder
    od-kill &&
    ssh  -i "$od_key" -N -f -L 'localhost:5555:localhost:8888' 'opendata@opendata1.mit.edu' &&
    chrome 'http://localhost:5555/tree/Dropbox%20(MIT)/Research/SafeDrop/python/Responses_Section' &&
    echo 'Locally accessed opendata notebook server'
end


# ------------------------
# Dropbox (MIT) directories
# ------------------------
alias dropbox_dir="cd ~/Dropbox\ \(MIT\)/"
alias db="dropbox_dir"

alias dropbox_planner_dir="cd ~/Dropbox\ \(MIT\)/Logs/Physics_Diary"
alias db_planner="dropbox_planner_dir"
alias pl="dropbox_planner_dir"

alias dropbox_thesis_dir="cd ~/Dropbox\ \(MIT\)/Thesis"
alias db_thesis="dropbox_thesis_dir"
alias th="dropbox_thesis_dir"

alias dropbox_EWOC_dir="cd /Users/sam/Dropbox\ \(MIT\)/EWOCs"
alias db_EWOC="dropbox_EWOC_dir"
alias ewoc="dropbox_EWOC_dir"


# ------------------------
# Misc
# ------------------------
alias chrome="open -a 'Google Chrome'"

alias happy="bash \"read -sp 'Password: ' pwd; [[ '$pwd' == '<3' ]] && open ~/Library/Misc\""

alias mvhappy="mv ~/Documents/temp/* ~/Library/Misc/pics/"
alias summertime_saga="open /Users/sam/Library/Misc/games/SummertimeSaga-0-20-16-mac"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# ============================
# Interactive Sessions:
# ============================

if status is-interactive
    # Commands to run in interactive sessions can go here
    # Function to find words in files. See
    # https://stackoverflow.com/questions/46950330/how-define-a-fish-shell-function-that-searches-for-a-pattern-within-certain-file
    function findin --argument searchterm
        set -q argv[1]; and echo "Searching for $searchterm"; or begin;
            echo "searchterm is required."; return 1; end;
        set -q argv[2]; and set -l filenamepattern $argv[2]; or set filenamepattern ".*"
        set -q argv[3]; and set -l grepopt $argv[3]; or set grepopt '-in'

        find . -type f -print0 | grep -iz "$filenamepattern" | xargs -0 grep "$searchterm" $grepopt
        echo "just ran:\n find . -type f -print0 | grep -iz \"$filenamepattern\" | xargs -0 grep \"$searchterm\" $grepopt"
    end
end

# Setting PATH for Python 3.11
# The original version is saved in /Users/sam/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"
