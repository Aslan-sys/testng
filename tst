import tkinter as tk
from gpiozero import LED

# LED pins using BCM numbering
living_room_led = LED(17)
bathroom_led = LED(27)
closet_led = LED(22)

# make sure all LEDs start OFF
living_room_led.off()
bathroom_led.off()
closet_led.off()

# create window
window = tk.Tk()
window.title("Linda's Light Control")
window.geometry("300x220")

# stores selected room
room = tk.StringVar()
room.set("")

# function to control LEDs
def turn_on_light():
    selected = room.get()

    # turn all lights off first
    living_room_led.off()
    bathroom_led.off()
    closet_led.off()

    # turn on only the selected light
    if selected == "Living Room":
        living_room_led.on()
        print("Living Room light is ON")
    elif selected == "Bathroom":
        bathroom_led.on()
        print("Bathroom light is ON")
    elif selected == "Closet":
        closet_led.on()
        print("Closet light is ON")

# function to close program safely
def exit_program():
    living_room_led.off()
    bathroom_led.off()
    closet_led.off()
    window.destroy()

# heading
title_label = tk.Label(window, text="Choose a room light", font=("Arial", 14))
title_label.pack(pady=10)

# radio buttons
living_radio = tk.Radiobutton(
    window,
    text="Living Room",
    variable=room,
    value="Living Room",
    command=turn_on_light
)
living_radio.pack(anchor="w", padx=40)

bathroom_radio = tk.Radiobutton(
    window,
    text="Bathroom",
    variable=room,
    value="Bathroom",
    command=turn_on_light
)
bathroom_radio.pack(anchor="w", padx=40)

closet_radio = tk.Radiobutton(
    window,
    text="Closet",
    variable=room,
    value="Closet",
    command=turn_on_light
)
closet_radio.pack(anchor="w", padx=40)

# exit button
exit_button = tk.Button(window, text="Exit", command=exit_program)
exit_button.pack(pady=20)

# keep GUI running
window.mainloop()
