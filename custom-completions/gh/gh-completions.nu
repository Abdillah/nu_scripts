
def "nu-complete gh" [] {
    ^gh --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh" [
    command?: string@"nu-complete gh"
    --help          # Show help for command
]

def "nu-complete gh auth" [] {
    ^gh auth --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh auth" [
    command?: string@"nu-complete gh auth"
    --help          # Show help for command
]

export extern "gh browse" [
    command?: string   # TODO: completion with [<PR number> | <file path> | <commit-SHA>]
    --branch(-b)       # Select another branch by passing in the branch name
    --commit(-c)       # Select another commit by passing in the commit SHA, default is the last commit
    --no-browser(-n)   # Print destination URL instead of opening the browser
    --projects(-p)     # Open repository projects
    --releases(-r)     # Open repository releases
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --settings(-s)     # Open repository settings
    --wiki(-w)         # Open repository wiki
    --help             # Show help for command
]

def "nu-complete gh codespace" [] {
    ^gh codespace --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh codespace" [
    command?: string@"nu-complete gh codespace"
    --help             # Show help for command
]

def "nu-complete gh gist" [] {
    ^gh gist --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh gist" [
    command?: string@"nu-complete gh gist"
    --help             # Show help for command
]

def "nu-complete gh issue" [] {
    ^gh issue --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh issue" [
    command?: string@"nu-complete gh issue"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh org" [] {
    ^gh org --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh org" [
    command?: string@"nu-complete gh org"
    --help             # Show help for command
]

def "nu-complete gh pr" [] {
    ^gh pr --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh pr" [
    command?: string@"nu-complete gh pr"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh project" [] {
    ^gh project --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh project" [
    command?: string@"nu-complete gh project"
    --help             # Show help for command
]

def "nu-complete gh release" [] {
    ^gh release --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh release" [
    command?: string@"nu-complete gh release"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh repo" [] {
    ^gh repo --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

def "nu-complete gh repo clone" [] {
    # regex that actually works
    # ^(?P<value>\S+) +(?P<description>\S+( \S+)*)? {2,}(?P<Visibility>public|private),?.*(?P<updated>about.*)
    ^gh repo list --limit 100 | lines | str replace --regex --multiline '\S+\K.*' ''
}

export extern "gh repo" [
    command?: string@"nu-complete gh repo"
    --help             # Show help for command
]

export extern "gh repo clone" [
    command: string@"nu-complete gh repo clone"
    --help             # Show help for command
]

def "nu-complete gh cache" [] {
    ^gh cache --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh cache" [
    command?: string@"nu-complete gh cache"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh run" [] {
    ^gh run --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh run" [
    command?: string@"nu-complete gh run"
    --help          # Show help for command
]

def "nu-complete gh workflow" [] {
    ^gh workflow --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh workflow" [
    command?: string@"nu-complete gh workflow"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh alias" [] {
    ^gh alias --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh alias" [
    command?: string@"nu-complete gh alias"
    --help          # Show help for command
]

def "nu-complete gh api" [] {
    # TODO
    # endpoints
    # ["graphql", "gists"]
}

export extern "gh api" [
    --cache                      # Cache the response, e.g. "3600s", "60m", "1h"
    --field(-F)                  # `key=value` Add a typed parameter in key=value format
    --header(-H)                 # `key:value` Add a HTTP request header in key:value format
    --hostname                   # The GitHub hostname for the request (default "github.com")
    --include(-i)                # Include HTTP response status line and headers in the output
    --input file                 # The file to use as body for the HTTP request (use "-" to read from standard input)
    --jq(-q)                     # Query to select values from the response using jq syntax
    --method(-X)                 # The HTTP method for the request (default "GET")
    --paginate                   # Make additional HTTP requests to fetch all pages of results
    --preview(-p)                # GitHub API preview names to request (without the "-preview" suffix)
    --raw-field(-f)              # `key:value` Add a string parameter in key=value format
    --silent                     # Do not print the response body
    --template(-t)               # Format JSON output using a Go template; see "gh help formatting"
    --verbose                    # Include full HTTP request and response in the output
    --help                   # Show help for command
    command?: string@"nu-complete gh api"
]

def "nu-complete gh completion" [] {
  ['bash', 'fish', 'powershell', 'zsh']
}

export extern "gh completion" [
    command?: string@"nu-complete gh completion"
    --shell(-s)     # Shell type: {bash|zsh|fish|powershell}
    --help          # Show help for command
]

def "nu-complete gh config" [] {
    ^gh config --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh config" [
    command?: string@"nu-complete gh config"
    --help          # Show help for command
]

def "nu-complete gh extension" [] {
    ^gh extension --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh extension" [
    command?: string@"nu-complete gh extension"
    --help          # Show help for command
]

def "nu-complete gh gpg-key" [] {
    ^gh gpg-key --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh gpg-key" [
    command?: string@"nu-complete gh gpg-key"
    --help          # Show help for command
]

def "nu-complete gh label" [] {
    ^gh label --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh label" [
    command?: string@"nu-complete gh label"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh ruleset" [] {
    ^gh ruleset --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh ruleset" [
    command?: string@"nu-complete gh ruleset"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh search" [] {
    ^gh search --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh search" [
    --extension      # Filter on file extension
    --filename       # Filter on filename
    --jq(-q)         # Filter JSON output using a jq expression
    --json           # Output JSON with the specified fields
    --language       # Filter results by language
    --limit(-L)      # Maximum number of code results to fetch (default 30)
    --match          # Restrict search to file contents or file path: {file|path}
    --owner          # Filter on owner
    --repo(-R)       # Filter on repository
    --size           # Filter on size range, in kilobytes
    --template(-t)   # Format JSON output using a Go template; see "gh help formatting"
    --web(-w) a      # Open the search query in the web browser   
    --help           # Show help for command
    command?: string@"nu-complete gh search"
]

def "nu-complete gh secret" [] {
    ^gh secret --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh secret" [
    command?: string@"nu-complete gh secret"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh ssh-key" [] {
    ^gh ssh-key --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh ssh-key" [
    command?: string@"nu-complete gh ssh-key"
    --help          # Show help for command
]

export extern "gh status" [
    command 
    --exclude(-e)   # Comma separated list of repos to exclude in owner/name format
    --org(-o)       # Report status within an organization
    --help          # Show help for command
]

def "nu-complete gh variable" [] {
    ^gh variable --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh variable" [
    command?: string@"nu-complete gh variable"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]
