#From: https://stackoverflow.com/questions/54743838/how-to-create-filters-for-qtableview-in-pyqt-by-text

import random
from PyQt5 import QtCore, QtGui, QtWidgets

class EditableHeaderView(QtWidgets.QHeaderView):
    textChanged = QtCore.pyqtSignal(int, str)

    def __init__(self, parent=None):
        super(EditableHeaderView, self).__init__(QtCore.Qt.Horizontal, parent)
        self._is_editable = dict()
        self.setSectionsClickable(True)
        self._lineedit = QtWidgets.QLineEdit(self, visible=False)
        self._lineedit.editingFinished.connect(self._lineedit.hide)
        self._lineedit.textChanged.connect(self.on_text_changed)
        self.sectionDoubleClicked.connect(self.on_sectionDoubleClicked)
        self._current_index = -1
        self._filters_text = dict()

    def setEditable(self, index, is_editable):
        if 0 <= index < self.count():
            self._is_editable[index] = is_editable

    @QtCore.pyqtSlot()
    def hide_lineedit(self):
        self._filters_text[self._current_index] = self._lineedit.text()
        self._lineedit.hide()
        self._current_index = -1
        self._lineedit.clear()

    @QtCore.pyqtSlot(int)
    def on_sectionDoubleClicked(self, index):
        self.hide_lineedit()
        is_editable = False
        if index in self._is_editable:
            is_editable = self._is_editable[index]
        if is_editable:
            geom = QtCore.QRect(self.sectionViewportPosition(index), 0, self.sectionSize(index), self.height())
            self._lineedit.setGeometry(geom)
            if index in self._filters_text:
                self._lineedit.setText(self._filters_text[index])
            self._lineedit.show()
            self._lineedit.setFocus()
            self._current_index = index
            self.textChanged.emit(self._current_index, self._lineedit.text())

    @QtCore.pyqtSlot(str)
    def on_text_changed(self, text):
        if self._current_index != -1:
            # self.model().setHeaderData(self._current_index, self.orientation(), text)
            self.textChanged.emit(self._current_index, text)

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, parent=None):
        super(MainWindow, self).__init__(parent)
        tableview = QtWidgets.QTableView()
        headerview = EditableHeaderView(tableview)
        tableview.setHorizontalHeader(headerview)
        model = QtGui.QStandardItemModel(20, 10, self)
        self._proxy = QtCore.QSortFilterProxyModel(self)
        self._proxy.setSourceModel(model)
        tableview.setModel(self._proxy)
        tableview.setSortingEnabled(True)

        for i in range(model.rowCount()):
            for j in range(model.columnCount()):
                text = ''.join(random.sample(list("abcdefghijklmnopqrstuvwxyz"), 4))
                it = QtGui.QStandardItem(text)
                model.setItem(i, j, it)

        headerview.setEditable(2, True)
        headerview.setEditable(4, True)
        headerview.setEditable(7, True)
        headerview.textChanged.connect(self.on_text_changed)
        self.setCentralWidget(tableview)
        self.resize(640, 480)

    @QtCore.pyqtSlot(int, str)
    def on_text_changed(self, col, text):
        self._proxy.setFilterKeyColumn(col)
        self._proxy.setFilterWildcard("*{}*".format(text) if text else "")

if __name__ == '__main__':
    import sys
    app = QtWidgets.QApplication(sys.argv)
    w = MainWindow()
    w.show()
    sys.exit(app.exec_())

