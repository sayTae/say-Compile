
function! CompileRun()
	
    " 현재 파일명을 얻어옵니다
    let current_file = expand('%')

    " 파일 확장자를 확인합니다
    let extension = fnamemodify(current_file, ':e')
	let bin_file = fnameescape('../bin/' . fnamemodify(current_file, ':t:r'))


    " 컴파일 명령어를 초기화합니다
    let compile_command = ''

    " 파일 확장자에 따라 적절한 컴파일 명령어를 설정합니다
    if extension ==# 'c'
        " C 파일인 경우
        let compile_command = 'gcc ' . current_file . ' -o ' . bin_file
    elseif extension ==# 'cpp'
        " C++ 파일인 경우
        let compile_command = 'g++ -std=c++11 ' . current_file . ' -o ' . bin_file
    elseif extension ==# 'java'
        " Java 파일인 경우
        let compile_command = 'javac -d ../bin ' . current_file
    elseif extension ==# 'py'
        " 파이썬 파일인 경우
        let compile_command = 'python3 ' . current_file
    else
        " 지원하지 않는 확장자인 경우 에러 메시지 출력
        echomsg 'Unsupported file extension: ' . extension
        return
    endif

    " 컴파일 명령어를 실행하고 결과를 저장합니다
    let compile_output = system(compile_command)

    " 컴파일 결과를 출력합니다
    if v:shell_error
        " 컴파일 실패 시, 오류 메시지를 빨간색으로 출력합니다
        echohl ErrorMsg | echomsg 'Compilation failed:' | echohl None
		echo "\n" . compile_output

    else
        " 컴파일 성공 시, 성공 메시지를 녹색으로 출력합니다
        echohl MoreMsg | echomsg 'Compilation successful!' | echohl None

    endif

endfunction
