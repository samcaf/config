" Vundle Setup ---------------------------------------------------------------- {{{

    " Setup for the vim package manager Vundle:
    " https://github.com/VundleVim/Vundle.vim

    " Disable compatibility with vi which can cause unexpected issues.
    set nocompatible

    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim

    call vundle#begin()
        " Packages that should be managed by Vundle
        " alternatively, pass a path where Vundle should install plugins
        "call vundle#begin('~/some/path/here')

        " let Vundle manage Vundle, required
        Plugin 'VundleVim/Vundle.vim'

        " Recommended plugins from several lists, including
        " https://www.vimfromscratch.com/articles/vim-for-python

        " Auto docstrings, with the command :Docstring
        Plugin 'pixelneo/vim-python-docstring'

        Plugin 'jimf/vim-pep8-text-width'
        Plugin 'ycm-core/YouCompleteMe'
        Plugin 'mikecoder/quickrun.vim'

        " File tree
        Plugin 'preservim/nerdtree'

        " Comments (:gcc for line, :gc for visual selection)
        Plugin 'tpope/vim-commentary'
        Plugin 'tpope/vim-surround'

        " Syntax highlighting
        " Plugin 'numirias/semshi'
        "   " Running into problems with this one:
        "   " Error detected while processing BufWipeout Autocommands for "*":
        "   " E117: Unknown function: SemshiBufWipeout
        Plugin 'davidhalter/jedi'
        Plugin 'neoclide/coc.nvim'

        " jupyter
        Plugin 'jupyter-vim/jupyter-vim'

        " PEP8 indentation behavior
        Plugin 'Vimjas/vim-python-pep8-indent'

        " Lint engine
        Plugin 'dense-analysis/ale'

        " Snippets
        " Track the engine.
        Plugin 'SirVer/ultisnips'
        " Snippets are separated from the engine. Add this if you want them:
        Plugin 'honza/vim-snippets'

        " LaTeX
        Plugin 'lervag/vimtex'

        " Latex Autocomplete
        Plugin 'neoclide/coc-vimtex'

        " Generates tag files
        " Plugin 'ludovicchabant/vim-gutentags'

        " Formats code
        " Plugin 'vim-autoformat/vim-autoformat'

        " Markdown specific plugins
        Plugin 'godlygeek/tabular'
        Plugin 'preservim/vim-markdown'
        Plugin 'JamshedVesuna/vim-markdown-preview'

        " Open URLs
        Plugin 'dhruvasagar/vim-open-url'

        " GhostText
        Plugin 'raghur/vim-ghost'

        " All of your Plugins must be added before the following line
    call vundle#end()            " required

" Basic Settings ---------------------------------------------------------------- {{{

    " Basic Settings go here

    " Setting colorscheme.
    set rtp+=~/.vim/vim-colorschemes/
    colorscheme desert

    " Enable type file detection. Vim will be able to try to detect the type of file in use.
    filetype on

    " Enable plugins and load plugin for the detected file type.
    filetype plugin on

    " Load an indent file for the detected file type.
    filetype indent on

    " Turn syntax highlighting on.
    syntax on

    " Allows backspace over auto-indentation
    set backspace=indent,eol,start

    " Add numbers to each line on the left-hand side.
    set number

    " Set shift width to 4 spaces.
    set shiftwidth=4

    " Set tab width to 4 columns.
    set tabstop=4

    " Use space characters instead of tabs.
    set expandtab

    " However, certain filetypes need tabs:
    autocmd Filetype make       setlocal noexpandtab
    autocmd Filetype yaml       setlocal shiftwidth=2 softtabstop=2
    autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2


    " Do not save backup files.
    set nobackup

    " While searching though a file incrementally highlight matching characters as you type.
    set incsearch

    " Show partial command you type in the last line of the screen.
    set showcmd

    " Show the mode you are on the last line.
    set showmode

    " Show matching words during a search.
    set showmatch

    " Use highlighting when doing a search.
    set hlsearch

    " Set the commands to save in history (default number is 20).
    set history=1000


    " Enable auto completion menu after pressing TAB.
    set wildmenu

    " Make wildmenu behave like similar to Bash completion.
    set wildmode=list:longest

    " There are certain files that we would never want to edit with Vim.
    " Wildmenu will ignore files with these extensions.
    set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

    " Copy to system clipboard
    set clipboard=unnamedplus,unnamed,autoselect

    " Enable spellcheck
    set spell

    " Highlight current line under cursor
    set cursorline

    " Mouse scrolling and resizing
    " Copying doesn't copy line numbers
    set mouse=a

    " Disable beep on errors, visual flash instead
    set noerrorbells
    set visualbell

    " Directory to store .swp files
    set dir=~/.cache/vim

    " Show matching parentheses
    set showmatch

    " set return to un-highlight search
    noremap <CR> :noh<CR>

    " Avoid wrapping a line in the middle of a word
    set linebreak

    " Enable folding
    set foldmethod=indent
    set foldlevel=99
    filetype plugin indent on

    " Enable folding with the spacebar
    nnoremap <space> za

    " Making folds automatic: vim saves and loads folds automatically
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview

    " Remove trailing whitespaces on save
    autocmd BufWritePre * :%s/\s\+$//e

    " Preparing to use a filetype plugin for latex
    let g:tex_flavor = "latex" " in ~.vim/after/ftplugin/latex.vim

    " Custom deletion commands
    nnoremap <leader>d "_d
    xnoremap <leader>d "_d
    xnoremap <leader>p "_dP
" }}}

" PLUGINS ---------------------------------------------------------------- {{{

    " Plugin code goes here.
    let g:vimtex_view_general_viewer = 'zathura'
    " let g:vimtex_view_general_viewer = 'open -a TeXshop'
    let g:vimtex_view_method = 'zathura'

    " LuaLaTex
    " Can't get this to work yet :D
    " let g:vimtex_compiler_engine = 'lualatex'

    " jedi-vim:
    " let g:jedi#use_tabs_not_buffers = 1

    " vim-python-docstring
    let g:python_style = 'numpy'
    " vim-pep8-text-width
    let g:pep8_text_width = 79           " Default 79
    let g:pep8_comment_text_width = 72   " Default 72

    " Linting and fixing with ALE
    let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'python3.8': ['flake8', 'pylint'],
      \   'cpp': ['g++'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

    let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'python': ['autopep8', 'autoflake', 'black', 'yapf'],
      \   'python3': ['autopep8', 'autoflake', 'black', 'yapf'],
      \   'python3.8': ['autopep8', 'autoflake', 'black', 'yapf'],
      \   'cpp': ['astyle', 'clang-format', 'clangtidy', 'uncrustify'],
      \}
    nmap <F10> :ALEFix<CR>
    let g:ale_fix_on_save = 1

    " ALE C++
    " let g:ale_c_parse_makefile = 1

    let g:ale_cpp_cc_executable = '/usr/bin/g++'
    " Default options:
    let g:ale_cpp_cc_options="-std=c++14 -Wall -O3"

    " Other ALE options
    let g:ale_set_balloons = 1
    let g:ale_hover_to_floating_preview = 1

    " ==============================
    " Conquer of completion (Coc)
    set updatetime=100
    set shortmess+=c

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " instead of having ~/.vim/coc-settings.json
    let s:LSP_CONFIG = {
          \  'flow': {
          \    'command': exepath('flow'),
          \    'args': ['lsp'],
          \    'filetypes': ['javascript', 'javascriptreact'],
          \    'initializationOptions': {},
          \    'requireRootPattern': 1,
          \    'settings': {},
          \    'rootPatterns': ['.flowconfig']
          \  }
          \}

    let s:languageservers = {}
    for [lsp, config] in items(s:LSP_CONFIG)
      let s:not_empty_cmd = !empty(get(config, 'command'))
      if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
    endfor

    if !empty(s:languageservers)
      call coc#config('languageserver', s:languageservers)
    endif

    " Display documentation with Coc
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Smart rename (renames the exports across all files)
    nmap <leader>rn <Plug>(coc-rename)

    " Allowing python3 for QuickRun
    let g:quickrun_known_file_types = {
        \"cpp": ["!g++ %", "./a.out"],
        \"c": ["!gcc %", "./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python3 %"],
        \"go": ["!go test"],
    \}


" }}}


" MAPPINGS --------------------------------------------------------------- {{{

    " Mappings code goes here.

    " Re-source the .vimrc file
    command Resource source ~/.vimrc

    " Mapping make to F9 key
    map <f9> make

    " File tree
    command Tree NERDTree

    " Snippets
    " Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " Markdown
    " Preview mapped to control-m
    let vim_markdown_preview_hotkey='<C-m>'
    " Setting up with grip
    let vim_markdown_preview_github=1
    " Opening with Google Chrome (currently broken -- see github)
    let vim_markdown_preview_browser='Google Chrome'

  " Open a vertical split on the right for python
    command Vertpy vertical botright term ipython

    " Run the current script
    command R QuickRun

    " Shortcut to copy all to system clipboard
    command Copyall %w !pbcopy

    " Commands to open useful physics resources
    command PIDlist OpenURL https://pdg.lbl.gov/2007/reviews/montecarlorpp.pdf#page=2
    command FastJetManual OpenURL http://fastjet.fr/repo/fastjet-doc-3.3.2.pdf
    command PythiaSite OpenURL https://pythia.org/latest-manual/

    " Movement that I may eventually want to remap:
    " https://stackoverflow.cofunction Include(lib)
" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

    " More Vimscripts code goes here.
    function! SetupCommandAbbrs(from, to)
      exec 'cnoreabbrev <expr> '.a:from
            \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
            \ .'? ("'.a:to.'") : ("'.a:from.'"))'
    endfunction

    " Use C to open coc config
    call SetupCommandAbbrs('C', 'CocConfig')

    " Check for custom configuration in the current directory
    au BufNewFile,BufRead * call CheckForCustomConfiguration()

    function! CheckForCustomConfiguration()
        " Check for .vim.custom in the directory containing the newly opened file
        let custom_config_file = expand('%:p:h') . '/.vim.custom'
        if filereadable(custom_config_file)
            exe 'source' custom_config_file
        endif
    endfunction
" }}}


" STATUS LINE ------------------------------------------------------------ {{{

    " Status bar code goes here.

    function! LinterStatus() abort
      let l:counts = ale#statusline#Count(bufnr(''))

      let l:all_errors = l:counts.error + l:counts.style_error
      let l:all_non_errors = l:counts.total - l:all_errors

      return l:counts.total == 0 ? '✨ all good ✨' : printf(
            \   '😞 %dW %dE',
            \   all_non_errors,
            \   all_errors
            \)
    endfunction

    set statusline=
    set statusline+=%m
    set statusline+=\ %f
    set statusline+=%=
    set statusline+=\ %{LinterStatus()}

" }}}
