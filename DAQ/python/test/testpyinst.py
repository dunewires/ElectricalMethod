from PyQt5.QtCore import QLibraryInfo, QCoreApplication
from pprint import pprint


# QLibraryInfo isn't always valid until a QCoreApplication is
# instantiated.
app = QCoreApplication([])
paths = [x for x in dir(QLibraryInfo) if x.endswith('Path')]
location = {x: QLibraryInfo.location(getattr(QLibraryInfo, x))
            for x in paths}
try:
    version = QLibraryInfo.version().segments()
except AttributeError:
    version = None
pprint({
    'isDebugBuild': QLibraryInfo.isDebugBuild(),
    'version': version,
    'location': location,
})
