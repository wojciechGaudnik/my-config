Vim�UnDo� �Դ��q�����H�SO@�����
QHHT�   
                                   b�p�    _�                             ����                                                                                                                                                                                                                                                                                                                                       ?           V        bz��    �             :       -- local fn = vim.fn   --    "-- -- Automatically install packer   R-- local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"   .-- if fn.empty(fn.glob(install_path)) > 0 then   #--   PACKER_BOOTSTRAP = fn.system {   --     "git",   --     "clone",   --     "--depth",   --     "1",   3--     "https://github.com/wbthomason/packer.nvim",   --     install_path,   --   }   9--   print "Installing packer close and reopen Neovim..."   $--   vim.cmd [[packadd packer.nvim]]   -- end   --    L-- -- Autocommand that reloads neovim whenever you save the plugins.lua file   -- vim.cmd [[   --   augroup packer_user_config   --     autocmd!   C--     autocmd BufWritePost plugins.lua source <afile> | PackerSync   --   augroup end   -- ]]   --    =-- -- Use a protected call so we don't error out on first use   5-- local status_ok, packer = pcall(require, "packer")   -- if not status_ok then   --   return   -- end   --    $-- -- Have packer use a popup window   -- packer.init {   --   display = {   --     open_fn = function()   C--       return require("packer.util").float { border = "rounded" }   --     end,   --   },   -- }   --    &-- return packer.startup(function(use)   --   -- My plugins here   --     --   use "neovim/nvim-lspconfig"   --   use "hrsh7th/cmp-nvim-lsp"   --   use "hrsh7th/cmp-buffer"   --   use "hrsh7th/cmp-path"   --   use "hrsh7th/cmp-cmdline"   --   use "hrsh7th/nvim-cmp"   --    --    I--   -- Automatically set up your configuration after cloning packer.nvim   ---   -- Put this at the end after all plugins   --   if PACKER_BOOTSTRAP then   --     require("packer").sync()   --   end   -- end)5��           :               �       �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b��     �               �               5��                          �               "       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b��     �                 !require "wgaudnik.autocompletion"5��                         �                      5�_�      
                     ����                                                                                                                                                                                                                                                                                                                                                             b��!     �                 require "wgaudnik."5��                         �                      5�_�         	       
          ����                                                                                                                                                                                                                                                                                                                                                             b��)     �                 require "wgaudnik.lsp"5��                         �                      5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             b��*    �                 require "wgaudnik."5��                         �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�f     �               �               5��                          �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�h     �                 require "wgaudnik.lsp"5��                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�h    �                 require "wgaudnik."5��                      	   �               	       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b��    �                require "wgaudnik.telescope"5��                         �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b���    �                -- require "wgaudnik.telescope"5��                         �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�B�     �               �               5��                          �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�B�     �                 require "wgaudnik.telescope"5��              	           �       	               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�B�   	 �                 require "wgaudnik."5��                      	   �               	       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�D�   
 �                 require "wgaudnik.treestter"5��                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   ?    b�K    �                 require "wgaudnik.treesitter"5��                         �                      5�_�                   	        ����                                                                                                                                                                                                                                                                                                                                                             b�o�     �                  5��                          �                      �    	                      �                      5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                             b�o�     �   	              #d136325��    	                      �                      5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             b�o�     �   	              '#d136325��    	                     �                      5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             b�o�    �   	   
          	'#d13632'5��    	                      �       
               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�p�     �      
   	    �      	   	    5��                          �                      5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             b�p�     �      
   
      require "wgaudnik.treesitter"5��              
           �       
               5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             b�p�    �      
   
      require "wgaudnik."5��                      	   �               	       5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                             b�p�     �   	               5��    	                      �                      �    
                      �                      �    
                                        �    
                                          �    
                    �                     �    
                                          �    
                    �                     �    
                                        �    
                                          5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�p�    �   
             #acb1215��    
                      �                      5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            	           	           v        b�K	     �   	   
        �      
            highlight = {       enable = true,       use_languagetree = true,   -    additional_vim_regex_highlighting = true,       disable = { "latex" },     },     autotag = { enable = true },   4  rainbow = { enable = true, extended_mode = true },     context_commentstring = {       enable = true,   B    config = { javascriptreact = { style_element = "{/*%s*/}" } },       typescript = "// %s",       css = "/* %s */",       scss = "/* %s */",       html = "<!-- %s -->",       svelte = "<!-- %s -->",       vue = "<!-- %s -->",       json = "",     },5��                          �                      �                          �                      �                         �               �      5�_�              
   	           ����                                                                                                                                                                                                                                                                                                                                                             b��%     �                 5��                          �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b}=      �                 �                        re5��                          �                      �                          �                      �                          �                      �                          �                      �                         �                     �                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b}=.     �      	        5��                          �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b}=/    �              5��                          �                      5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             b�&�     �                 �                re5��                                                  �                                                  5��