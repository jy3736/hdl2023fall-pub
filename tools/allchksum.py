import os
import subprocess

chksum = {}
script_root = os.path.dirname(__file__)
if script_root == "":
    script_root = "."
cmd = f"{script_root}/chksum.py"
#print(f"cmd = {cmd}")

# Function to explore all subdirectories and calculate checksum
def explore_and_calculate_checksum(root_dir):
    global chksum
    for root, _, files in os.walk(root_dir):
        if 'testbench.v' in files:
            pyc_file_path = os.path.join(root, 'testbench.v')
            #print(pyc_file_path)
            # Run chksum.py using subprocess to calculate the checksum
            process = subprocess.Popen(['python', cmd, pyc_file_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            stdout, _ = process.communicate()
            checksum = stdout.strip()
            # Get the relative directory path based on the current directory
            relative_dir = os.path.relpath(root, root_dir)
            chksum[relative_dir] = checksum
            #print(chksum)

if __name__ == "__main__":
    current_directory = os.getcwd()
    explore_and_calculate_checksum(current_directory)
    with open('mydata.py', 'w') as file:
        file.write("targets = {\n")
        dirs = list(chksum.keys())
        dirs.sort()
        for d in dirs:
            file.write(f"    '{d}': '{chksum[d]}',\n")
        file.write("}\n\n")
        
        file.write("scores = {\n")
        for d in dirs:
            file.write(f"    '{d}': 10,\n")
        file.write("}\n")