# Useful HPC Bash Aliases

This document provides a collection of useful bash aliases for working in HPC environments, particularly those using SLURM. These aliases include PBS/SGE-style command mappings for SLURM, safer file operations, and various utility functions.

## Quick Setup

Copy the following block into your `~/.bashrc` file:

```bash
# SLURM Job Management (PBS/SGE style)
alias qstat="squeue -u \$USER"
alias qw="watch -n 2 squeue -u \$USER"
alias qsub=sbatch
alias qdel=scancel
alias sq='squeue -u $USER -o "%.18i %.9P %.8j %.8u %.2t %.10M %.6D %R"'
alias usage='sreport cluster AccountUtilizationByUser start=0101 format=Login,Proper,Account,Used'

# Listing and File Information
alias la="ls -la"
alias lh="ls -lh"
alias ll="ls -l"
alias lt="ls -ltr"
alias df='df -h'
alias duh="du -h --max-depth=1"

# Directory Navigation
alias cdd='cd -'
alias ..="cd .."
alias ...="cd ../.."
alias path='echo $PATH | tr ":" "\n"'
alias pwdcp='pwd | tr -d "\n" | xclip'

# Safe File Operations
alias rm="rm -i"
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias wget='wget -c'

# Process Management
alias psg='ps aux | grep'
alias topme='top -u $USER'

# Search and Find
alias findh='find . -name'
alias greph='grep -r --color'
```

After adding these aliases, run:
```bash
source ~/.bashrc
```

## Detailed Explanation

### SLURM Job Management
These aliases make SLURM commands more familiar to users coming from PBS or SGE systems:

- `qstat`: Shows your current jobs in the queue (equivalent to `squeue -u $USER`)
- `qw`: Watch your queue status, updating every 2 seconds
- `qsub`: Submit a job (equivalent to `sbatch`)
- `qdel`: Delete a job (equivalent to `scancel`)
- `sq`: Enhanced queue display with formatted output
- `usage`: Show your cluster usage statistics

### Listing and File Information
Enhanced versions of common listing commands:

- `la`: Long listing including hidden files
- `lh`: Long listing with human-readable sizes
- `ll`: Long listing
- `lt`: List files sorted by modification time (newest last)
- `df`: Disk usage in human-readable format
- `duh`: Directory sizes in human-readable format

### Directory Navigation
Shortcuts for navigating directories:

- `cdd`: Return to previous directory
- `..`: Go up one directory
- `...`: Go up two directories
- `path`: Display PATH environment variable, one entry per line
- `pwdcp`: Copy current directory path to clipboard

### Safe File Operations
Safer versions of common file operations that prompt before overwriting:

- `rm`: Prompt before removal
- `cp`: Prompt before overwriting
- `mv`: Prompt before overwriting
- `mkdir`: Create parent directories if needed
- `wget`: Resume interrupted downloads

### Process Management
Tools for managing processes:

- `psg`: Search for a process
- `topme`: Show only your processes in top

### Search and Find
Enhanced search commands:

- `findh`: Quick find by name in current directory
- `greph`: Recursive grep with color highlighting

## Notes
- These aliases are particularly useful in HPC environments but can be used in any bash shell
- The prompting behavior of the safe file operations can be overridden by adding the `-f` flag
- Some aliases (like `pwdcp`) may require additional software installation
- Customize the aliases based on your specific needs and workflow

## Usage Tips
1. Always source your `.bashrc` after making changes: `source ~/.bashrc`
2. Test new aliases in a safe environment before using them with important data
3. Consider adding your own custom aliases for frequently used commands
