" =============================================================================
" Load file in the plugins directory
" =============================================================================
"
call plug#begin('~/.config/nvim/plugged')


let vimsettings = "~/.config/nvim/plugins"
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, "*.vim"), "\n")
  exe 'source' fpath
endfor


call plug#end()

