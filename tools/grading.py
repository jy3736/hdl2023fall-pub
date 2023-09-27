import os
import subprocess
import hashlib
from mydata import targets, scores

# ---------------------------------------------------------------------

passed = {}

def calculate_checksum(file_path):
    sha256 = hashlib.sha256()
    with open(file_path, "rb") as file:
        while True:
            data = file.read(65536)
            if not data:
                break
            sha256.update(data)
    return sha256.hexdigest()


def main():
    global targets, passed
    passed = {}
    current_directory = os.getcwd()
    for directory, expected_checksum in targets.items():
        print(f"Checking '{directory}' => ", end="")
        os.chdir(directory)
        actual_checksum = calculate_checksum("testbench.v")
        passed[directory] = False
        if actual_checksum == expected_checksum:
            process = subprocess.Popen(
                ["python", "../testing.pyc"],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            stdout, stderr = process.communicate()
            #print(stderr)
            if process.returncode == 0:
                passed[directory] = True
                print("Passed!")
            elif process.returncode == 1:
                print("Execution Error!")
            elif process.returncode == 3:
                print("Compilation Error!")
            else:
                print("Error, Something Wrong!")
        else:
            print("Testbench Changed!")
        os.chdir(current_directory)


def submit():
    global passed
    pass


if __name__ == "__main__":
    main()
    total = 0
    for p in passed.keys():
        if passed[p]:
            total += scores[p]
    print(f"Grade: {total}")
