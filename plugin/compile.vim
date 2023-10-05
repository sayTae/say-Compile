
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
			# Check if the compilation was successful
			if [ $? -eq 0 ]; then
				# If compilation is successful, print a success message in green color
				echo -e "\033[0;32mCompilation completed successfully!\033[0m"
			else
				# If compilation fails, print a failure message in red color
				echo -e "\033[0;31mCompilation failed.\033[0m"
			fi
				" echo Compilation success!!"

        elseif (&filetype == 'cpp')
                exec "!g++ -std=c++11 % -o ../bin/%:r"
				echo "Compilation success!!"
                " exec !../bin/%:r < ~/.config/nvim/input.txt"

        endif

endfunc

let g:clang_options = '-std=c++11 -Wno-c++11-extensions'
