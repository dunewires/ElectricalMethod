from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg
from matplotlib.figure import Figure
from channel_frequencies import l_physical_wire_G, l_physical_wire_U, l_physical_wire_V, l_physical_wire_X
import numpy as np

class APA_Diagram_View(FigureCanvasQTAgg):

    def __init__(self, parent=None):
        # self.setParent(parent) optional
        #self.fig = Figure(figsize=(5, 5))
        self.model = None

        self._apaWidth  = 2306.7
        self._apaNominalWidth  = 2300
        self._apaHeight = 5997.32
        self.setPlotColors()
        
        self.fig = Figure(figsize=((self._apaWidth)/1500, self._apaHeight/1500))
        super(APA_Diagram_View, self).__init__(self.fig)

        
    def setPlotColors(self):
        self.apaFrameColor = 'black'
        
    def setModel(self, model):
        if model == self.model:
            return

        self.model = model
        
        # otherwise, disconnect any existing signals/slots
        # and connect the new ones.
        self.model.signals.dataChanged.connect(self.redraw)

        self.redraw()
        
    def drawFrame(self):
        stage = self.model.apaStage
        
        self.combs = []
        self.combs.append(self.axes.axhline(1163,color=self.apaFrameColor,linestyle='dashed',linewidth=0.5))
        self.combs.append(self.axes.axhline(2347,color=self.apaFrameColor,linestyle='dashed',linewidth=0.5))
        self.combs.append(self.axes.axhline(3531,color=self.apaFrameColor,linestyle='dashed',linewidth=0.5))
        self.combs.append(self.axes.axhline(4715,color=self.apaFrameColor,linestyle='dashed',linewidth=0.5))
        
        if stage != 'Installation (Top)':
            self.axes.set_xlim([(self._apaNominalWidth+self._apaWidth)/2, (self._apaNominalWidth-self._apaWidth)/2])
            self.axes.set_ylim([0, self._apaHeight])
        else:
            self.axes.set_xlim([(self._apaNominalWidth-self._apaWidth)/2, (self._apaNominalWidth+self._apaWidth)/2])
            self.axes.set_ylim([self._apaHeight, 0])
            self.axes.xaxis.set_ticks_position('top')
            self.axes.xaxis.set_label_position('top')

        number_of_head_boards = 10
        self.axes.set_xticks([x for x in np.arange(0,self._apaNominalWidth+self._apaNominalWidth/number_of_head_boards, self._apaNominalWidth/number_of_head_boards)])
        self.axes.tick_params('both', length=6, left=False, labelbottom=False, labeltop=False, labelleft=False, width=0.5)
        self.axes.set_xlabel('Head boards',labelpad=10)
        self.axes.set_aspect('equal') 

    def clearFigure(self):
        self.fig.clear()
        self.axes = self.fig.add_subplot(1,1,1)
        
    def drawWires(self):
        stage = self.model.apaStage
        layer = self.model.apaLayer
        side = self.model.apaSide
        channels = self.model.apaChans

        offsetXVG = 0
        offsetXVGback = self._apaNominalWidth
        offsetU = (self._apaNominalWidth-self._apaWidth)/2
        offsetUback = (self._apaNominalWidth+self._apaWidth)/2
        direction = 1
        directionback = -1
        style = '-'
        styleback = (0, (5, 5))

        # Uncomment block below to not change point of view of diagram when scanning far side of APA
        # if side == 'B':
        #     offsetXVG, offsetXVGback = offsetXVGback, offsetXVG
        #     offsetU, offsetUback = offsetUback, offsetU
        #     direction, directionback = directionback, direction
        #     style, styleback = styleback, style

        lines1 = {}
        lines2 = {}
        lines3 = {}

        for channel_number in channels:
            line1, = self.axes.plot([],'r', linewidth = 0.2, linestyle = style)
            line2, = self.axes.plot([],'r', linewidth = 0.2, linestyle = styleback)
            line3, = self.axes.plot([],'r', linewidth = 0.2, linestyle = style)
        
            line1.set_xdata([])
            line1.set_ydata([])
            line2.set_xdata([])
            line2.set_ydata([])
            line3.set_xdata([])
            line3.set_ydata([])

            lines1[channel_number] = line1
            lines2[channel_number] = line2
            lines3[channel_number] = line3

        
        for channel_number in channels:
            # print('Channel frequencies in Hz\n(ordered in increasing distance from the head boards):\n')
            if layer == 'X':
                lines1[channel_number].set_xdata([offsetXVG+direction*l_physical_wire_X[channel_number-1].y_start, offsetXVG+direction*l_physical_wire_X[channel_number-1].y_end])
                lines1[channel_number].set_ydata([l_physical_wire_X[channel_number-1].x_start, l_physical_wire_X[channel_number-1].x_end])
                lines1[channel_number].set_linestyle(style)
                # print('Segment 1: ', end='')
                # for length in l_physical_wire_X[channel_number-1].lengths():
                #     if(length != l_physical_wire_X[channel_number-1].lengths()[-1]):
                #         print(f'{get_frequency(length):.2f}',end=', ')
                #     else:
                #         print(f'{get_frequency(length):.2f}')
            if layer == 'V':
                # copy l_physical_wire = l_physical_wire_V outside to avoid copying twice block of code
                for index,wire in enumerate(l_physical_wire_V):
                    if index%400 == channel_number-1:
                        if index < 400:
                            lines1[channel_number].set_xdata([offsetXVG+direction*wire.y_start,offsetXVG+direction*wire.y_end])
                            lines1[channel_number].set_ydata([wire.x_start,wire.x_end])
                            lines1[channel_number].set_linestyle(style)
                            # print('Segment 1: ', end='')
                        elif 400 <= index <= 799:
                            lines2[channel_number].set_xdata([offsetXVGback+directionback*wire.y_start,offsetXVGback+directionback*wire.y_end])
                            lines2[channel_number].set_ydata([wire.x_start,wire.x_end])
                            lines2[channel_number].set_linestyle(styleback)
                            # print('Segment 2: ', end='')
                        else:
                            lines3[channel_number].set_xdata([offsetXVG+direction*wire.y_start,offsetXVG+direction*wire.y_end])
                            lines3[channel_number].set_ydata([wire.x_start,wire.x_end])
                            lines3[channel_number].set_linestyle(style)
                            # print('Segment 3: ', end='')
                        # for length in wire.lengths():
                        #     if(length != wire.lengths()[-1]):
                        #         print(f'{get_frequency(length):.2f}',end=', ')
                        #     else:
                        #         print(f'{get_frequency(length):.2f}')
            if layer == 'U':
                for index,wire in enumerate(l_physical_wire_U):
                    if index%400 == channel_number-1:
                        if index < 400:
                            lines1[channel_number].set_xdata([offsetU+direction*wire.y_start,offsetU+direction*wire.y_end])
                            lines1[channel_number].set_ydata([wire.x_start,wire.x_end])
                            lines1[channel_number].set_linestyle(style)
                            # print('Segment 1: ', end='')
                        elif 400 <= index <= 799:
                            lines2[channel_number].set_xdata([offsetUback+directionback*wire.y_start,offsetUback+directionback*wire.y_end])
                            lines2[channel_number].set_ydata([wire.x_start,wire.x_end])
                            lines2[channel_number].set_linestyle(styleback)
                            # print('Segment 2: ', end='')
                        else:
                            lines3[channel_number].set_xdata([offsetU+direction*wire.y_start,offsetU+direction*wire.y_end])
                            lines3[channel_number].set_ydata([wire.x_start,wire.x_end])
                            lines3[channel_number].set_linestyle(style)
                            # print('Segment 3: ', end='')
                        # for length in wire.lengths():
                        #     if(length != wire.lengths()[-1]):
                        #         print(f'{get_frequency(length):.2f}',end=', ')
                        #     else:
                        #         print(f'{get_frequency(length):.2f}')
            if layer == 'G':
                lines1[channel_number].set_xdata([offsetXVG+direction*l_physical_wire_G[channel_number-1].y_start, offsetXVG+direction*l_physical_wire_G[channel_number-1].y_end])
                lines1[channel_number].set_ydata([l_physical_wire_G[channel_number-1].x_start, l_physical_wire_G[channel_number-1].x_end])
                lines1[channel_number].set_linestyle(style)
                # print('Segment 1: ', end='')
                # for length in l_physical_wire_G[channel_number-1].lengths():
                #     if(length != l_physical_wire_G[channel_number-1].lengths()[-1]):
                #         print(f'{get_frequency(length):.2f}',end=', ')
                #     else:
                #         print(f'{get_frequency(length):.2f}')

        otherSide = 'B' if side == 'A' else 'A'
        if layer in {'G', 'X'}:
            self.fig.legend([self.combs[0],lines1[channels[0]]], ['Comb',f'Wire side {side}'], frameon=False, loc='upper center',ncol=2)
        elif layer in {'U', 'V'}:
            dummy, = self.axes.plot([],[],color='none')
            self.fig.legend([self.combs[0], dummy, lines1[channels[0]], lines2[channels[0]]], ['Comb','',f'Wire side {side}', f'Wire side {otherSide}'], frameon=False, loc='upper center',ncol=2)
        else:
            self.fig.legend([self.combs[0]], ['Comb'], frameon=False, loc='upper center',ncol=2)

        # plt.title(f'Channel: {layer}{side}{channel_number}')
   
    def redraw(self):
        self.clearFigure()
        self.drawFrame()
        self.drawWires()
        self.fig.canvas.draw_idle()
