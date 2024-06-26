function vif() {
    local fname
    fname=$(fzf) || return
    nvim "$fname"
}

function zf() {
    local fname
    fname=$(find . -not -path '*/.*' -maxdepth 3 -type d | fzf)
    z "$fname"
}

bindkey -s '^N' 'vif^M'

# open zshrc with <c-z>
bindkey -s '^Z' 'nvim ~/.zshrc^M'

bindkey -s '^F' 'zf^M'

# open lua folder with <c-l>
bindkey -s '^W' 'nvim ~/.config/nvim/lua^M'

# ssh into br3
bindkey -s '^Y' 'ssh edge.bigred3.target.com^M'
