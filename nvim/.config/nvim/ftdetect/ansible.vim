autocmd BufRead,BufNewFile */playbooks/*.yml,*/playbooks/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile */handlers/*.yml,*/handlers/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile */tasks/*.yml,*/tasks/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile */templates/*.yml,*/templates/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile */vars/*.yml,*/vars/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile */host_vars/* set filetype=yaml.ansible
autocmd BufRead,BufNewFile */group_vars/ set filetype=yaml.ansible

