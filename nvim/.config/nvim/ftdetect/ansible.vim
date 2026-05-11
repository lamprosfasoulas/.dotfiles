autocmd BufRead,BufNewFile *ansible*/playbooks/*.yml,*ansible*/playbooks/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile *ansible*/handlers/*.yml,*ansible*/handlers/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile *ansible*/tasks/*.yml,*ansible*/tasks/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile *ansible*/templates/*.yml.j2,*ansible*/templates/*.yaml.j2 set filetype=yaml.ansible
autocmd BufRead,BufNewFile *ansible*/vars/*.yml,*ansible*/vars/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile *ansible*/host_vars/* set filetype=yaml.ansible
autocmd BufRead,BufNewFile *ansible*/group_vars/* set filetype=yaml.ansible

