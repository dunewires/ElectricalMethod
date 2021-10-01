from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg
from matplotlib.figure import Figure
import numpy as np

class PhysicalWire():
    """A physical wire that is soldered at both ends."""
    def __init__(self, x_start, y_start, x_end, y_end):
        self.x_start = x_start
        self.y_start = y_start
        self.x_end = x_end
        self.y_end = y_end

class APA_Diagram_View(FigureCanvasQTAgg):

    def __init__(self, parent=None):
        # self.setParent(parent) optional
        #self.fig = Figure(figsize=(5, 5))
        self.model = None

        self._apaWidth  = 2306.7
        self._apaHeight = 5997.32
        self.setPlotColors()

        self.initPhysicalWires()
        
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

        self.line1, = self.axes.plot([],'r')
        self.line2, = self.axes.plot([],'r')
        self.line3, = self.axes.plot([],'r')
        
        #plt.gcf().canvas.toolbar_visible = False
        #plt.gcf().canvas.header_visible = False
        #plt.gcf().canvas.footer_visible = False
        
    def clearFigure(self):
        self.fig.clear()
        self.axes = self.fig.add_subplot(1,1,1)
        
    def drawWires(self):
        print("draw wires")
        print(f"self.model.apaChans = {self.model.apaChans}")


        # KLUGE:
        wire_number = 60
        layer = "V"
        offset = 0
        offsetback = self._apaWidth
        direction = 1
        directionback = -1
        style = '-'
        styleback = '--'
        
        if layer == 'V':
            print("Layer V")
            for index,wire in enumerate(self.l_physical_wire_V):
                if index%400 == wire_number-1:
                    if index < 400:
                        self.line1.set_xdata([offset+direction*wire.y_start,offset+direction*wire.y_end])
                        self.line1.set_ydata([wire.x_start,wire.x_end])
                        self.line1.set_linestyle(style)
                    elif 400 <= index <= 799:
                        self.line2.set_xdata([offsetback+directionback*wire.y_start,offsetback+directionback*wire.y_end])
                        self.line2.set_ydata([wire.x_start,wire.x_end])
                        self.line2.set_linestyle(styleback)
                    else:
                        self.line3.set_xdata([offset+direction*wire.y_start,offset+direction*wire.y_end])
                        self.line3.set_ydata([wire.x_start,wire.x_end])
                        self.line3.set_linestyle(style)
        
        #self.axes.plot([self.l_physical_wire_X[0].y_start, self.l_physical_wire_X[0].y_end],
        #               [self.l_physical_wire_X[0].x_start, self.l_physical_wire_X[0].x_end],
        #               'r'
        #               )
        
    def redraw(self):
        self.clearFigure()
        self.drawFrame()
        self.drawWires()

    def initPhysicalWires(self):

        self.l_physical_wire_X = []
        self.l_physical_wire_V = []
        self.l_physical_wire_U = []
        self.l_physical_wire_G = []
        for index in range(1151):
            if index < 480:
                self.l_physical_wire_X.append(PhysicalWire(*self.physical_wire_position('X',index+1,'start'),
                                                           *self.physical_wire_position('X',index+1,'end')))
            self.l_physical_wire_V.append(PhysicalWire(*self.physical_wire_position('V',index+1,'start'),
                                                       *self.physical_wire_position('V',index+1,'end')))
            self.l_physical_wire_U.append(PhysicalWire(*self.physical_wire_position('U',index+1,'start'),
                                                       *self.physical_wire_position('U',index+1,'end')))
            if index < 481:
                self.l_physical_wire_G.append(PhysicalWire(*self.physical_wire_position('G',index+1,'start'),
                                                           *self.physical_wire_position('G',index+1,'end')))

    def physical_wire_position(self, wire_layer: str, wire_number: int, position_type: str):
        """Given a wire layer letter ("X", "V", "U" or "G"), physical wire number and position type ("start" or "end"), return the corresponding physical wire's position tuple in millimeters along the (length, width) axes of the APA."""
    
        X_WIRE_NUMBER_MAX = 480
        VU_WIRE_NUMBER_MAX = 1151
        G_WIRE_NUMBER_MAX = 481
    
        wire_layer = wire_layer.upper()
        position_type = position_type.lower()
        
        if wire_layer not in ('X','V','U','G'):
            raise ValueError('Wrong wire layer identifier value: only "X", "U", "V" or "G" can be used.')
        
        if wire_layer in ('X'):
            if not 1 <= wire_number <= X_WIRE_NUMBER_MAX:
                raise ValueError(f'Wrong X physical wire number value: only 1 to {X_WIRE_NUMBER_MAX} can be used.')
        elif wire_layer in ('V','U'):
            if not 1 <= wire_number <= VU_WIRE_NUMBER_MAX:
                raise ValueError('Wrong V or U physical wire number value: only 1 to {UV_WIRE_NUMBER_MAX} can be used.')
        elif wire_layer in ('G'):
            if not 1 <= wire_number <= G_WIRE_NUMBER_MAX:
                raise ValueError('Wrong G physical wire number value: only 1 to {G_WIRE_NUMBER_MAX} can be used.')
    
        if position_type not in ('start','end'):
            raise ValueError('Wrong position type value: only "start" or "end" can be used.')
    
        x_near_offset = 0
        x_near_pitch = 0
        y_near_offset = 0
        y_near_pitch = 0
        x_far_offset = 0
        x_far_pitch = 0
        y_far_offset = 0
        y_far_pitch = 0
        wire_number_edge_transition = 0
        
        if wire_layer == 'X':
            y_far_offset = -2300/X_WIRE_NUMBER_MAX/2
            y_far_pitch = 2300/X_WIRE_NUMBER_MAX
            if position_type == 'start':
                x_far_offset = 5987.62
    
        if wire_layer == 'V':
            if position_type == 'start':
                wire_number_edge_transition = 751
                x_near_offset = -24
                x_near_pitch = 8
                x_far_offset = 5987.6
                y_far_pitch = 5.75
            if position_type == 'end':
                wire_number_edge_transition = 402
                y_near_offset = -16.25
                y_near_pitch = 5.75
                x_far_pitch = 8
                y_far_offset = 2300
    
        if wire_layer == 'U':
            if position_type == 'start':
                wire_number_edge_transition = 751
                x_near_offset = -19.1
                x_near_pitch = 8
                y_near_offset = 2306.7
                x_far_offset = 5991
                y_far_offset = 2306.7
                y_far_pitch = -5.75
            if position_type == 'end':
                wire_number_edge_transition = 403
                y_near_offset = 2322.95
                y_near_pitch = -5.75
                x_far_offset = -6.5
                x_far_pitch = 8
    
        if wire_layer == 'G':
            y_far_offset = -2300/X_WIRE_NUMBER_MAX
            y_far_pitch = 2300/X_WIRE_NUMBER_MAX
            if position_type == 'start':
                x_far_offset = 5997.32
    
        if wire_number <= wire_number_edge_transition:
            x_pos = x_near_offset + wire_number*x_near_pitch
            y_pos = y_near_offset + wire_number*y_near_pitch
        else:
            x_pos = x_far_offset + (wire_number-wire_number_edge_transition)*x_far_pitch
            y_pos = y_far_offset + (wire_number-wire_number_edge_transition)*y_far_pitch
    
        return (x_pos, y_pos)
    
