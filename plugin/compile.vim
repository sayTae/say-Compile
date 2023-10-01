
func! CompileRun()
        exec "w"

        " CompileRun Func
        if (&filetype == 'java')
                exec "!javac -d ../bin %"
                echo "Compilation success!!"
                " exec !java -cp ../bin %:r < ~/.config/nvim/input.txt"

        elseif (&filetype == 'python')
                exec "!python3 % < ~/.config/nvim/input.txt"

        elseif (&filetype == 'c')
                exec "!gcc % -o ../bin/%:r"
				echo "Compilation success!!"
                " exec !../bin/%:r < ~/.config/nvim/input.txt"

        elseif (&filetype == 'cpp')
                exec "!g++ -std=c++11 % -o ../bin/%:r"
				echo "Compilation success!!"
                " exec !../bin/%:r < ~/.config/nvim/input.txt"

        endif

endfunc

let g:clang_options = '-std=c++11 -Wno-c++11-extensions'
