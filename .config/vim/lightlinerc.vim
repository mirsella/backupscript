let g:lightline = {
      \   'active': {
      \     'left': [['mode'], ['readonly', 'absolutepath', 'modified']],
      \     'right': [['lineinfo'], ['percent', 'lineCurrentOnTotal', 'colCurrentOnTotal'], ['fileformat', 'filetype']]
      \   },
      \   'inactive': {
      \     'left': [['mode', 'paste'], ['readonly', 'absolutepath', 'modified']],
      \     'right': [['lineinfo'], ['percent', 'lineCurrentOnTotal', 'colCurrentOnTotal'], ['fileformat', 'filetype']]
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
      \ },
      \ }
