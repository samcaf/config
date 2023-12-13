set -l plot_ewocs_commands pythia showerpy
complete -f -c plot_ewocs -n "not __fish_seen_subcommand_from $plot_ewocs_commands" -a "$plot_ewocs_commands"
