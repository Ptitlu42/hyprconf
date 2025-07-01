#!/usr/bin/env python3
import evdev
from evdev import InputDevice, categorize, ecodes
import subprocess
import psutil

device = evdev.InputDevice('/dev/input/event7')

start_y = None
end_y = None
MIN_SWIPE_DISTANCE = 1200
current_process = None

def run_command(command):
    global current_process
    try:
        if current_process:
            terminate_process(current_process)
            current_process = None
        else:
            current_process = subprocess.Popen(command, shell=True)
        print(e)

def terminate_process(process):
    try:
        parent = psutil.Process(process.pid)
        for child in parent.children(recursive=True):
            child.terminate()
        parent.terminate()
    except Exception as e:
        print(e)

for event in device.read_loop():
    if event.type == ecodes.EV_ABS and event.code == ecodes.ABS_MT_POSITION_Y:
        if start_y is None:
            start_y = event.value
        else:
            end_y = event.value
    
    if event.type == ecodes.EV_KEY and event.code == ecodes.BTN_TOUCH and event.value == 0:
        if start_y is not None and end_y is not None:
            swipe_distance = start_y - end_y
            if abs(swipe_distance) > MIN_SWIPE_DISTANCE:
                if swipe_distance > 0:
                    run_command("svkbd-mobile-intl")
                else:
                    run_command("svkbd-mobile-intl")
        start_y = None
        end_y = None