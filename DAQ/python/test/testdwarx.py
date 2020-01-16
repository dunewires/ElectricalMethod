import numpy as np
import matplotlib.pyplot as plt
import dwaTools as dwa

#fh = open('mmTest1F.python.small.txt')
#fh = open('mmTest1F.python.txt')
fh = open('junk.txt')
lines = fh.readlines()
fh.close()

data = []  # amplitude (vs. time) data from a single stimulation frequency

fig, axs = plt.subplots(2)
amplVsTime, = axs[1].plot([], [], 'k.') # dummy plot to establish curve
amplVsFreq, = axs[0].plot([], [], 'ro') # ditto 
plt.ion()
plt.show()

freqs = []  # stimulation frequencies
ampls = []  # response amplitudes
nfreqs = 0  # keep track of how many stimulation frequencies there have been

lastLine = ''
for line in lines:

    if line.startswith('CAFE'):
        # New header detected
        lastLine = line


        # Do analysis on the last dataset (assuming that there was one!)
        # reset the data array
        # FIXME: this means we will miss the last stimulation frequency
        # since there is no 'CAFE' header after it.  Need a way to know
        # when a dataset from a given frequency is completed.

        # Update the data set for plotting
        # fit sine-wave to data from last stimulation frequency
        if len(data) > 0:
            ampls.append(nfreqs) # FIXME: this should be the amplitude of data vs. time signal
            freqs.append(headerDict['STIM_FREQ_HZ'])
            # update plot
            amplVsFreq.set_xdata(freqs)
            amplVsFreq.set_ydata(ampls)
            axs[0].set_xlim(min(freqs), max(freqs))
            axs[0].set_ylim(min(ampls), max(ampls))
            fig.canvas.draw()
            plt.show()
            fig.canvas.flush_events()
            #junk = input("frequency complete.. hit key to continue")
        continue

    if lastLine.startswith('CAFE'):
        print("")
        print("Parsing header")
        print("  {}".format(lastLine), end="")
        print("  {}".format(line), end="")
        headerDict = dwa.parseUdpHeader(lastLine, line, verbose=False)
        print(headerDict)
        lastLine = ''

        nfreqs += 1

        # clear data array for next frequency
        data.clear()
        #print("  Data = ")
        continue

    # Parse data
    #print("    {}".format(line), end="")
    data += dwa.parseUdpDataLine(line)
    #print(data)
    lastLine = line

    # update plots
    # FIXME: need to compute the time array, too!
    tt = np.arange(len(data))
    #print("len(tt) = {}".format(len(tt)))
    amplVsTime.set_ydata(data)
    amplVsTime.set_xdata(tt)
    axs[1].set_xlim(min(tt), max(tt))
    axs[1].set_ylim(min(data), max(data))
    fig.canvas.draw()
    plt.show()
    fig.canvas.flush_events()


    #junk = input("hit enter to continue")

