from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg
from matplotlib.figure import Figure
import numpy as np

#import sys
#sys.path.append("./mappings/")
#import channel_map

#get_frequency = channel_map.length_to_frequency
#l_physical_wire_X = channel_map.l_physical_wire_X
#l_physical_wire_V = channel_map.l_physical_wire_V
#l_physical_wire_U = channel_map.l_physical_wire_U
#l_physical_wire_G = channel_map.l_physical_wire_G

class APA_Diagram_View(FigureCanvasQTAgg):

    def __init__(self, parent=None):
        # self.setParent(parent) optional
        #self.fig = Figure(figsize=(5, 5))
        self.model = None

        self._apaWidth  = 2306.7
        self._apaHeight = 5997.32
        self.setPlotColors()
        
        self.fig = Figure(figsize=(self._apaWidth/1500, self._apaHeight/1500))

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
        print("draw frame")
        self.axes.plot([1,2,3],[1,2,3])
        self.axes.set_xlim([self._apaWidth, 0])
        self.axes.set_ylim([0, self._apaHeight])
        self.axes.set_aspect('equal')

        self.axes.axhline(1163,color=self.apaFrameColor)
        self.axes.axhline(2347,color=self.apaFrameColor)
        self.axes.axhline(3531,color=self.apaFrameColor)
        self.axes.axhline(4715,color=self.apaFrameColor)
        
        self.axes.set_xticks([x for x in np.arange(0,self._apaWidth + self._apaWidth/10, self._apaWidth/10)])  # change to actual location?                                        
        self.axes.tick_params('both', length=6, left=False, labelbottom=False, labelleft=False)
        self.axes.set_xlabel('Head boards',labelpad=10)

        #plt.gcf().canvas.toolbar_visible = False
        #plt.gcf().canvas.header_visible = False
        #plt.gcf().canvas.footer_visible = False
        
    def clearFigure(self):
        self.fig.clear()
        self.axes = self.fig.add_subplot(1,1,1)
        
    def drawWires(self):
        print("draw wires")
        print(f"self.model.apaChans = {self.model.apaChans}")
        #line1, = plt.plot([l_physical_wire_X[0].y_start, l_physical_wire_X[0].y_end],
        #                  [l_physical_wire_X[0].x_start, l_physical_wire_X[0].x_end],
        #                  'r')
        #line2, = plt.plot([],'r')
        #line3, = plt.plot([],'r')
        
    def redraw(self):
        self.clearFigure()
        self.drawFrame()
        self.drawWires()
