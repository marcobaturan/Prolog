"""Lesson15: Python Swi-Prolog with frontend.
    
    This programs is a version of two mixed
    exercices:
        - Python binding Swi-Prolog in the game
          of coins.
        - Using PySimpleGUI to give a desktop
          application.
    - Now I can binding Python, Prolog and
      visual layer for user friendly interaction
    Founts:
        - https://pysimplegui.readthedocs.io/en/latest/
        - PySwip
"""
# Import
from __future__ import print_function
from pyswip import Prolog, Functor, Variable, Query
import PySimpleGUI as sg

try:
    input = raw_input
except NameError:
    pass

def consult(values):
    count = int(values[0] or 100)
    total = int(values[1] or 500)
    coins = Functor("coins", 3)
    S = Variable()
    q = Query(coins(S, count, total))
    i = 0
    # Consult the kdb
    while q.nextSolution():
        ## [1,5,10,50,100]
        s = zip(S.value, [1, 5, 10, 50, 100])
        print(i, end=" ")
        for c, v in s:
            print("%dx%d" % (c,v), end=" ")
        print()
    i += 1
    q.closeQuery()

def main():
    prolog = Prolog()  # Call class
    prolog.consult("coins.pl") # Call consult
    sg.theme('DarkAmber')   # Add a touch of color
    # All the stuff inside your window.
    layout = [[sg.Text("How many coins (default: 100)? "), sg.InputText()],
              [sg.Text("What should be the total (default: 500)? "), sg.InputText()],
              [sg.Button('Coins!'),sg.Button('Close!')] ]
    # Create the Window
    window = sg.Window('Python-Swi-Prolog: Coins', layout)
    # Event Loop to process "events" and get the "values" of the inputs
    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break
        elif event == 'Coins!': # if user closes window or clicks cancel
            consult(values=values)
        elif event == 'Close!':
            break
        else:
            pass
    window.close()



if __name__ == "__main__":
    main()