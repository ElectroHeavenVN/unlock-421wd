import os
import csv
import sys
import xml.etree.ElementTree as ET
tree = ET.parse(os.path.dirname(__file__) + '/page_index.xml')
root = tree.getroot()

for category in root.iter('category'):
    for page in category:
        if ( sys.argv[1] == page.get("file")):
            if (sys.argv[2] == "add"):
                page.set('noindex', 'false')
            elif (sys.argv[2] == "remove"):
                page.set('noindex', 'true')
            tree.write(os.path.dirname(__file__) + '/page_index.xml')
            break
