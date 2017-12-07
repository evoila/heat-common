#!/usr/bin/env python
import subprocess
import re
import os

p = subprocess.Popen(['ip', 'route', 'list'], stdout=subprocess.PIPE)
out, err = p.communicate()
lines = out.split('\n')

result = {}
for line in lines:
  if re.match("^[0-9./]* dev", line):
    tiles = line.split(" ")
    result[tiles[0]] = tiles[2]

path = os.environ['heat_outputs_path'] + ".map"
file = open(path, "w")
file.write(str(result))
file.close()
