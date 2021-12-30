use 'preservim/nerdtree'  -- nerdtree file system explorer. 


use 'neoclide/coc.nvim', {'branch': 'release'}  -- coc code completion 
    
use 'SirVer/ultisnips'  -- snippets 
    use 'honza/vim-snippets'
    let g:SuperTabDefaultCompletionType = '<C-n>'
    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<c-tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " use numpy style docstrings
    let g:ultisnips_python_style="numpy"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]


use 'junegunn/goyo.vim'  -- Goyo - better control of window size 

use 'scrooloose/nerdcommenter'  -- Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Enable NERDCommenterToggle to check all selected lines is commented or not 
    let g:NERDToggleCheckAllLines = 1



use 'dense-analysis/ale'  -- Ale Asynchronous Lint Engine in place of syntastic 

use 'skywind3000/asyncrun.vim'  -- skywind3000/asyncrun.vim - run async shell commands in vim 

use 'vhdirk/vim-cmake'  -- vim-cmake - make working with CMake a little nicer 

    use 'idanarye/vim-merginal'


use 'ctrlpvim/ctrlp.vim'  -- Active fork of kien/ctrlp.vim—Fuzzy file, buffer etc finder 



use 'preservim/tagbar'  -- Tagbar: a class outline viewer for vim 

"  'frazrepo/vim-rainbow' had some conflicts with the spell checker for some files  -- vim-rainbow: Rainbow Parentheses 
        "   so I had to replace it with the following
    use 'luochen1990/rainbow' 
    " enable globally
    let g:rainbow_active = 1

" ---- tender: Colorscheme for Vim   -- Colorschemes 
      use 'jacoborus/tender.vim'

use 'kyoz/purify', { 'rtp': 'vim' }  -- purify: Colorscheme for Vim 

use 'altercation/vim-colors-solarized'  -- vim-colors-solarized: Solarized Colorscheme for Vim 

use 'morhetz/gruvbox'  -- gruvbox: Colorscheme for Vim 

use 'jiangmiao/auto-pairs'  -- Auto Pairs: Insert or delete brackets, parens, quotes in pair 

use 'Vimjas/vim-python-pep8-indent'  -- A nicer Python indentation style for vim 


use 'plasticboy/vim-markdown'  -- Markdown syntax highlighting, matching rules and mappings.  

use 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}  -- Markdown Preview for (Neo)vim  



use 'AndrewRadev/switch.vim'  -- Switch - Toggle booleans and more  
    let g:switch_mapping = "-"

use 'nishigori/increment-activator'  -- IncrementActivator - increment plugin 

use 'jmcantrell/vim-virtualenv'  -- vim-virtualenv' - working with venvs 


use 'drmikehenry/vim-fontsize'  -- vim-fontsize - adjust font size 


use 'Glench/Vim-Jinja2-Syntax'  -- Vim-Jinja2-Syntax  - support Jinja2 suntax 








function! DoRemote(arg)  -- vim-matlab %a 
          UpdateRemoteuseins
        endfunction

        use 'daeyun/vim-matlab', { 'do': function('DoRemote') }

