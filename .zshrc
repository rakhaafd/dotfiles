# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Custom alias

alias stegsolve="cd ~/tools && java -jar stegsolve.jar"
alias c="cd /mnt/c/Users/Rakha\ Fausta/Downloads"
alias d="cd /mnt/d/"
alias ls="exa --icons"
alias conf="nano ~/.zshrc"
alias src="source ~/.zshrc"
alias bat="batcat"
alias cl="clear"
alias py="python3"
alias ipy="ipython3"
alias bsp="pip install --break-system-packages"
alias pyex="python3 /mnt/d/ctf/pyinstxtractor.py"
alias pt="ptpython"
alias binwalk='sudo binwalk "$@" --run-as=root'

function get() {
# Cek apakah URL diberikan sebagai argumen
if [ -z "$1" ]; then
  echo "Usage: $0 <url>"
  exit 1
fi

# Ambil URL dari argumen dan ganti 'blob' dengan 'raw'
URL="$1"
MODIFIED_URL=$(echo "$URL" | sed 's/blob/raw/g')

# Jalankan wget dengan URL yang sudah dimodifikasi
wget "$MODIFIED_URL"
}

# membuat file dan cd langsung
function mc() {
  mkdir -p "$1" && cd "$1"
}

# initial repo
repo() {
  git init && git add .
  read "msg?Commit message: " || return
  [[ -z "$msg" ]] && echo "❌ Pesan kosong." && return
  git commit -m "$msg" || return
  git branch -M main
  read "url?Remote repo URL: " || return
  [[ -z "$url" ]] && echo "❌ URL kosong." && return
  git remote add origin "$url" && git push -u origin main
}

export PATH="$HOME/.local/bin:$PATH"
