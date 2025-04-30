from ranger.api.commands import Command
import subprocess

class wcl(Command):
    """
    :wcl

    Count the number of lines in a file and display the result.
    """

    def execute(self):
        if self.arg(1):
            filepath = self.rest(1)
        else:
            filepath = self.fm.thisfile.path
        output = self.fm.execute_command(f"wc -l {filepath}", stdout=subprocess.PIPE)
        stdout, stderr = output.communicate()
        if output.returncode == 0:
            line_count = stdout.decode('utf-8').split()[0]
            self.fm.notify(f"Lines: {line_count}")
        else:
            self.fm.notify("Error counting lines", bad=True)

