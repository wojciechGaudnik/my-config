Vim�UnDo� �O8��om5��}r�?�������j�]   J   *    always_show_bufferline = true | false,   D   !      (       (   (   (    b�_�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             b�]     �         J      j    numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,5��                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�]0     �         J      m    numbers = "none" -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,5��                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�]�     �         J      [    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"5��                        �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�]�     �         J      [    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"5��                        W                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�]�     �          J      -    diagnostics = false | "nvim_lsp" | "coc",5��                         E                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�]�     �          J      '    diagnostics = | "nvim_lsp" | "coc",5��                         E                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�]�     �          J      %    diagnostics = "nvim_lsp" | "coc",5��                         O                     5�_�      	                 )    ����                                                                                                                                                                                                                                                                                                                                                             b�]�     �          J      )    diagnostics = "nvim_lsp", -- | "coc",5��       )                  \                     5�_�      
           	      ,    ����                                                                                                                                                                                                                                                                                                                                                             b�]�     �          J      ,    diagnostics = "nvim_lsp", -- | "coc", | 5��       ,                  _                     5�_�   	              
      -    ����                                                                                                                                                                                                                                                                                                                                                             b�]�     �          J      .    diagnostics = "nvim_lsp", -- | "coc", | ""5��       ,                 _                    5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                         &          &    b�^,     �      
   J      [    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"   <    -- NOTE: this plugin is designed with this icon in mind,�      	   J    5��                                              5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                         &          &    b�^/     �      	   J      h    middle_mouse_command = "Bdelete! %d"nil,          -- can be a string | function, see "Mouse actions"5��       (                                       5�_�                           ����                                                                                                                                                                                                                                                                                                                                         &          &    b�^<     �         J      [    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"5��                         V                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                         &          &    b�^=     �         J      N    right_mouse_command = , -- can be a string | function, see "Mouse actions"5��                         V                     5�_�                    8   =    ����                                                                                                                                                                                                                                                                                                                                         &          &    b�^�     �   7   9   J      v    offsets = {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},5��    7   =                  p
                     5�_�                    8   L    ����                                                                                                                                                                                                                                                                                                                                         &          &    b�^�     �   7   9   J      �    offsets = {{filetype = "NvimTree", text = "File Explorer", padding = 1 }}, -- | function , text_align = "left" | "center" | "right"}},5��    7   L                  
                     5�_�                    8       ����                                                                                                                                                                                                                                                                                                                                         &          &    b�^�     �   7   9   J      �    offsets = {{filetype = "NvimTree", text = "File Explorer", padding = 1 } }, -- | function , text_align = "left" | "center" | "right"}},5��    7                     B
                     5�_�                    8       ����                                                                                                                                                                                                                                                                                                                                         &          &    b�^�     �   7   9   J      �    offsets = { {filetype = "NvimTree", text = "File Explorer", padding = 1 } }, -- | function , text_align = "left" | "center" | "right"}},5��    7                     D
                     5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�^�     �   8   :   J      U    color_icons = true | false, -- whether or not to add the filetype icon highlights5��    8                     �
                     5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�^�     �   9   ;   J      K    show_buffer_icons = true | false, -- disable filetype icons for buffers5��    9                     7                     5�_�                    ;   #    ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�^�     �   :   <   J      +    show_buffer_close_icons = true | false,5��    :   #                  �                     5�_�                    <   $    ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�^�     �   ;   =   J      r    show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon5��    ;   $                  �                     5�_�                    =       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�^�     �   <   >   J      #    show_close_icon = true | false,5��    <                     '                     5�_�                    >       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�^�     �   =   ?   J      '    show_tab_indicators = true | false,5��    =                     Q                     5�_�                    B       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_      �   A   C   J      D    separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },5��    A                     4                     �    A                     :                     5�_�                    B       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_     �   A   C   J      M    separator_style = "thin" - "slant" | "thick" | "thin" | { 'any', 'any' },5��    A                     <                     5�_�                    C       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_     �   B   D   J      (    enforce_regular_tabs = false | true,5��    B                     �                     5�_�                    C       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_     �   B   D   J      "    enforce_regular_tabs = | true,5��    B                     �                     5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_     �   8   :   J      X    color_icons = true -- | false, -- whether or not to add the filetype icon highlights5��    8                     �
                     5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_     �   9   ;   J      N    show_buffer_icons = true -- | false, -- disable filetype icons for buffers5��    9                     7                     5�_�                     ;   "    ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_      �   :   <   J      -    show_buffer_close_icons = true --| false,5��    :   "                  �                     5�_�      !               <   #    ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_!     �   ;   =   J      t    show_buffer_default_icon = true --| false, -- whether or not an unrecognised filetype should show a default icon5��    ;   #                  �                     5�_�       "           !   =       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_&     �   <   >   J      %    show_close_icon = true --| false,5��    <                     *                     �    <                    *                    5�_�   !   #           "   >       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_*     �   =   ?   J      )    show_tab_indicators = true --| false,5��    =                    V                    5�_�   "   $           #   B       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_-     �   A   C   J      N    separator_style = "thin" -- "slant" | "thick" | "thin" | { 'any', 'any' },5��    A                     A                     5�_�   #   %           $   D   !    ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_0     �   C   E   J      *    always_show_bufferline = true | false,5��    C   !                  �                     5�_�   $   &           %   D   #    ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_1     �   C   E   J      +    always_show_bufferline = true, | false,5��    C   #                  �                     5�_�   %   '           &   E       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�__     �   D   F          �    sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)5��    D           �       �   �      �       �       5�_�   &   (           '   G       ����                                                                                                                                                                                                                                                                                                                            9          :          v       b�_f    �   F   H          2      return buffer_a.modified > buffer_b.modified5��    F           2       5   y      2       5       5�_�   '               (   H       ����                                                                                                                                                                                                                                                                                                                                                             b�_�    �   G   I              end5��    G                  
   �             
       5��