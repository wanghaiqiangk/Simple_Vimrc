let g:Lf_ShowDevIcons = 0
let g:Lf_WindowHeight = 0.30

noremap <leader>t :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap g<leader>. :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
noremap <leader>. :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
xnoremap g<leader>. :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
xnoremap <leader>. :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", leaderf#Rg#visual())<CR>
noremap <leader>o :<C-U>Leaderf! rg --recall<CR>
noremap g<leader>i :LeaderfFunction<CR>
noremap <leader>i :LeaderfFunctionCword<CR>
noremap <leader>r :LeaderfMru<CR>
