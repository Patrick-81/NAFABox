#!/usr/bin/python
from Tkinter import *
import os

class Application(Frame):
    def setres(self, res):
        cmd="xrandr --fb "+res
        print "res:",cmd
        os.system(cmd)

    def createWidgets(self):

        self.label=Label(self, text="Resolution")
        self.label.pack({"side": "top"})

        self.res1920x1080 = Button(self, text="1920x1080", command=lambda: self.setres("1920x1080"))
        self.res1920x1080.pack({"side": "top"})

        self.res1600x900 = Button(self, text="1600x900", command=lambda: self.setres("1600x900"))
        self.res1600x900.pack({"side": "top"})

        self.res1366x768 = Button(self, text="1366x768", command=lambda: self.setres("1366x768"))
        self.res1366x768.pack({"side": "top"})

        self.res1280x800 = Button(self, text="1280x800", command=lambda: self.setres("1280x800"))
        self.res1280x800.pack({"side": "top"})

        self.res1280x720 = Button(self, text="1280x720", command=lambda: self.setres("1280x720"))
        self.res1280x720.pack({"side": "top"})

        self.Quit = Button(self, text="Quit", fg="red", command=self.quit)
        self.Quit.pack({"side": "top"})

    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.pack()
        self.createWidgets()

root = Tk()
root.title("Resolution")
app = Application(master=root)
app.mainloop()
root.destroy()
