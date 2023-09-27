import subprocess

# Compile the Verilog code using Icarus Verilog
compile_command = "iverilog -o testbench testbench.v"
compile_process = subprocess.Popen(compile_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
compile_out, compile_err = compile_process.communicate()

if compile_process.returncode == 0:
    print("Compilation successful.")
    
    # Execute the compiled binary
    execute_command = "./testbench"
    execute_process = subprocess.Popen(execute_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    execute_out, execute_err = execute_process.communicate()
    execute_out = str(execute_out.decode('utf-8'))
    print(execute_out)
    if execute_out.find("Error:") == -1:
        print("Test PASSED.")
        exit(0)
    else:
        print("Execution Error")
        exit(1)
else:
    print("Compilation FAILED.")
    exit(3)
