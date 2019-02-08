#!/bin/bash
test $(curl http://10.242.1.75:8765/sum?a=1\&b=2) -eq 3
