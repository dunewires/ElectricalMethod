import random
from PyQt5.QtCore import Qt, QSortFilterProxyModel, QRegExp
from PyQt5.QtGui import QStandardItem, QStandardItemModel
from PyQt5.QtWidgets import (
    QApplication,
    QFormLayout,
    QLineEdit,
    QTableView,
    QVBoxLayout,
    QWidget,
)

class SortFilterProxyModel(QSortFilterProxyModel):
    def __init__(self, *args, **kwargs):
        QSortFilterProxyModel.__init__(self, *args, **kwargs)
        self.filters = {}

    def setFilterByColumn(self, regex, column):
        self.filters[column] = regex
        self.invalidateFilter()

    def filterAcceptsRow(self, source_row, source_parent):
        for key, regex in self.filters.items():
            ix = self.sourceModel().index(source_row, key, source_parent)
            if ix.isValid():
                text = self.sourceModel().data(ix)
                if regex.indexIn(text) == -1:
                    return False
        return True

def random_word():
    letters = "abcdedfg"
    word = "".join([random.choice(letters) for _ in range(random.randint(4, 7))])
    return word


class Widget(QWidget):
    def __init__(self, *args, **kwargs):
        QWidget.__init__(self, *args, **kwargs)
        self.setLayout(QVBoxLayout())

        tv1 = QTableView(self)
        tv2 = QTableView(self)
        model = QStandardItemModel(8, 4, self)
        proxy = SortFilterProxyModel(self)
        proxy.setSourceModel(model)
        tv1.setModel(model)
        tv2.setModel(proxy)
        self.layout().addWidget(tv1)
        self.layout().addWidget(tv2)

        for i in range(model.rowCount()):
            for j in range(model.columnCount()):
                item = QStandardItem()
                item.setData(random_word(), Qt.DisplayRole)
                model.setItem(i, j, item)

        flayout = QFormLayout()
        self.layout().addLayout(flayout)
        for i in range(model.columnCount()):
            le = QLineEdit(self)
            flayout.addRow("column: {}".format(i+1), le)
            le.textChanged.connect(lambda text, col=i:
                                   proxy.setFilterByColumn(QRegExp(text, Qt.CaseSensitive, QRegExp.FixedString),
                                                           col))


if __name__ == '__main__':
    import sys

    app = QApplication(sys.argv)
    w = Widget()
    w.show()
    sys.exit(app.exec_())

    
