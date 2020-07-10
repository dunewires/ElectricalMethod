# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'dwaGui.ui'
#
# Created by: PyQt5 UI code generator 5.14.0
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(764, 664)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.amplVsFreq = PlotWidget(self.centralwidget)
        self.amplVsFreq.setGeometry(QtCore.QRect(270, 310, 461, 291))
        self.amplVsFreq.setObjectName("amplVsFreq")
        self.voltageVsTime = PlotWidget(self.centralwidget)
        self.voltageVsTime.setGeometry(QtCore.QRect(270, 10, 461, 291))
        self.voltageVsTime.setObjectName("voltageVsTime")
        self.outputText = QtWidgets.QPlainTextEdit(self.centralwidget)
        self.outputText.setGeometry(QtCore.QRect(20, 10, 171, 551))
        self.outputText.setObjectName("outputText")
        self.configFile = QtWidgets.QLineEdit(self.centralwidget)
        self.configFile.setGeometry(QtCore.QRect(20, 570, 111, 31))
        self.configFile.setObjectName("configFile")
        self.pushButton = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton.setGeometry(QtCore.QRect(140, 570, 51, 31))
        self.pushButton.setAutoFillBackground(False)
        self.pushButton.setStyleSheet("background-color: green")
        self.pushButton.setObjectName("pushButton")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 764, 26))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "DWA DAQ"))
        self.configFile.setText(_translate("MainWindow", "Config filename"))
        self.pushButton.setText(_translate("MainWindow", "Start"))
from pyqtgraph import PlotWidget
