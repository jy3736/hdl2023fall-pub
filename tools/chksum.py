import hashlib
import sys

class ChecksumCalculator:
    def __init__(self, script_name):
        self.script_name = script_name

    def calculate_checksum(self):
        sha256 = hashlib.sha256()
        try:
            with open(self.script_name, 'rb') as file:
                while True:
                    data = file.read(65536)  # Read in 64k chunks
                    if not data:
                        break
                    sha256.update(data)
            return sha256.hexdigest()
        except FileNotFoundError:
            return f"File not found: {self.script_name}"
        except Exception as e:
            return f"An error occurred: {e}"

if __name__ == "__main__":
    # Get the script name from command-line arguments or use the default
    if len(sys.argv) > 1:
        script_name = sys.argv[1]
    else:
        script_name = 'testbench.v'  # Replace with the default script name

    # Create an instance of ChecksumCalculator
    calculator = ChecksumCalculator(script_name)

    # Calculate and print the checksum
    checksum_result = calculator.calculate_checksum()
    print(checksum_result)
