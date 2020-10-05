let g:lightline = {
      \   'active': {
      \     'left': [['mode', 'paste'], ['readonly', 'absolutepath', 'modified']],
      \     'right': [['percent', 'linecol'], ['fileformat', 'gitbranch', 'filetype']]
      \   },
      \   'inactive': {
      \     'left': [['mode', 'paste'], ['readonly', 'absolutepath', 'modified']],
      \     'right': [['lineinfo'], ['percent', 'lineCurrentOnTotal', 'colCurrentOnTotal'], ['fileformat', 'gitbranch', 'filetype']]
      \   },
      \   'tabline': {
      \     'left': [['buffers']]
      \   },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_raw': {
      \ 'buffers': 1
      \ },
      \ 'component_function': {
      \   'fileformat': 'lightline#functionsfileformat_devicons',
      \   'filetype': 'lightline#functions#filetype_devicons',
      \   'lineCurrentOnTotal': 'LineCurrentOnTotal',
      \   'colCurrentOnTotal': 'ColCurrentOnTotal',
      \   'linecol': 'LineCol',
      \   'gitbranch': 'GitBranch',
      \ },
      \ }
