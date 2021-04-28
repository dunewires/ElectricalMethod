from IPython.display import display
import numpy as np
import matplotlib.pyplot as plt
from bqplot import *
import ipywidgets
import channel_map


_width = 2306.7
_height = 5997.32

get_frequency = channel_map.length_to_frequency

l_physical_wire_X = channel_map.l_physical_wire_X
l_physical_wire_V = channel_map.l_physical_wire_V
l_physical_wire_U = channel_map.l_physical_wire_U
l_physical_wire_G = channel_map.l_physical_wire_G

layer_widget=ipywidgets.RadioButtons(options=['X','V','U','G'], description='Layer:')
side_widget=ipywidgets.RadioButtons(options=['A','B'], description='Side:')
wire_number_widget=ipywidgets.IntSlider(value=1, min=1, max=480, step=1, description='Number:',layout=ipywidgets.Layout(width='99%'))
out = ipywidgets.Output(layout={'border': '1px solid black'})
output = ipywidgets.Output()
output2 = ipywidgets.Output()

def update_wire_number_widget(*args):
    max_value = {'X':480, 'V':400, 'U':400, 'G':481}
    wire_number_widget.max = max_value[layer_widget.value]

layer_widget.observe(update_wire_number_widget,'value')

with output:
    plt.figure(figsize=(_width/1500,_height/1500))
    plt.axhline(1163,color='black')
    plt.axhline(2347,color='black')
    plt.axhline(3531,color='black')
    plt.axhline(4715,color='black')
    plt.xlim(_width,0)
    plt.ylim(0,_height)
    plt.xticks([x for x in np.arange(0,_width+_width/10,_width/10)])  # change to actual location?
    plt.tick_params('both', length=6, left=False, labelbottom=False, labelleft=False)
    plt.xlabel('Head boards',labelpad=10)
    plt.gca().set_aspect('equal')
    # plt.show()
    plt.gcf().canvas.toolbar_visible = False
    plt.gcf().canvas.header_visible = False
    plt.gcf().canvas.footer_visible = False
    line1, = plt.plot([l_physical_wire_X[0].y_start, l_physical_wire_X[0].y_end], [l_physical_wire_X[0].x_start, l_physical_wire_X[0].x_end], 'r')
    line2, = plt.plot([],'r')
    line3, = plt.plot([],'r')

def f(*args):
    layer = layer_widget.value
    side = side_widget.value
    wire_number = wire_number_widget.value

    offset = 0
    offsetback = _width
    direction = 1
    directionback = -1
    style = '-'
    styleback = '--'
    if side == 'B':
        offset, offsetback = offsetback, offset
        direction, directionback = directionback, direction
        style, styleback = styleback, style

    line1.set_xdata([])
    line1.set_ydata([])
    line2.set_xdata([])
    line2.set_ydata([])
    line3.set_xdata([])
    line3.set_ydata([])

    output2.clear_output(wait=True)
    with output2:
        print('Channel frequencies in Hz\n(ordered in increasing distance from the head boards):\n')
        if layer == 'X':
            line1.set_xdata([offset+direction*l_physical_wire_X[wire_number-1].y_start, offset+direction*l_physical_wire_X[wire_number-1].y_end])
            line1.set_ydata([l_physical_wire_X[wire_number-1].x_start, l_physical_wire_X[wire_number-1].x_end])
            line1.set_linestyle(style)
            print('Segment 1: ', end='')
            for length in l_physical_wire_X[wire_number-1].lengths():
                if(length != l_physical_wire_X[wire_number-1].lengths()[-1]):
                    print(f'{get_frequency(length):.2f}',end=', ')
                else:
                    print(f'{get_frequency(length):.2f}')
        if layer == 'V':
            # copy l_physical_wire = l_physical_wire_V outside to avoid copying twice block of code
            for index,wire in enumerate(l_physical_wire_V):
                if index%400 == wire_number-1:
                    if index < 400:
                        line1.set_xdata([offset+direction*wire.y_start,offset+direction*wire.y_end])
                        line1.set_ydata([wire.x_start,wire.x_end])
                        line1.set_linestyle(style)
                        print('Segment 1: ', end='')
                    elif 400 <= index <= 799:
                        line2.set_xdata([offsetback+directionback*wire.y_start,offsetback+directionback*wire.y_end])
                        line2.set_ydata([wire.x_start,wire.x_end])
                        line2.set_linestyle(styleback)
                        print('Segment 2: ', end='')
                    else:
                        line3.set_xdata([offset+direction*wire.y_start,offset+direction*wire.y_end])
                        line3.set_ydata([wire.x_start,wire.x_end])
                        line3.set_linestyle(style)
                        print('Segment 3: ', end='')
                    for length in wire.lengths():
                        if(length != wire.lengths()[-1]):
                            print(f'{get_frequency(length):.2f}',end=', ')
                        else:
                            print(f'{get_frequency(length):.2f}')
        if layer == 'U':
            for index,wire in enumerate(l_physical_wire_U):
                if index%400 == wire_number-1:
                    if index < 400:
                        line1.set_xdata([offset+direction*wire.y_start,offset+direction*wire.y_end])
                        line1.set_ydata([wire.x_start,wire.x_end])
                        line1.set_linestyle(style)
                        print('Segment 1: ', end='')
                    elif 400 <= index <= 799:
                        line2.set_xdata([offsetback+directionback*wire.y_start,offsetback+directionback*wire.y_end])
                        line2.set_ydata([wire.x_start,wire.x_end])
                        line2.set_linestyle(styleback)
                        print('Segment 2: ', end='')
                    else:
                        line3.set_xdata([offset+direction*wire.y_start,offset+direction*wire.y_end])
                        line3.set_ydata([wire.x_start,wire.x_end])
                        line3.set_linestyle(style)
                        print('Segment 3: ', end='')
                    for length in wire.lengths():
                        if(length != wire.lengths()[-1]):
                            print(f'{get_frequency(length):.2f}',end=', ')
                        else:
                            print(f'{get_frequency(length):.2f}')
        if layer == 'G':
            line1.set_xdata([offset+direction*l_physical_wire_G[wire_number-1].y_start, offset+direction*l_physical_wire_G[wire_number-1].y_end])
            line1.set_ydata([l_physical_wire_G[wire_number-1].x_start, l_physical_wire_G[wire_number-1].x_end])
            line1.set_linestyle(style)
            print('Segment 1: ', end='')
            for length in l_physical_wire_G[wire_number-1].lengths():
                if(length != l_physical_wire_G[wire_number-1].lengths()[-1]):
                    print(f'{get_frequency(length):.2f}',end=', ')
                else:
                    print(f'{get_frequency(length):.2f}')

        plt.title(f'Channel: {layer}{side}{wire_number}')

layer_widget.observe(f,'value')
side_widget.observe(f,'value')
wire_number_widget.observe(f,'value')

controls = ipywidgets.VBox([layer_widget, side_widget, wire_number_widget,output2],layout=ipywidgets.Layout(width='70%'))
display(ipywidgets.HBox([output,controls]))