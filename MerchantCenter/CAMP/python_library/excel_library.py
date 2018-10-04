from xlrd import open_workbook

class excel_library(object):

    def __init__(self):

        self.book = None
        self.sheet = None
        self.dict_list = None
        self.keyNameofFirstColumn = None

    def _serialize(self):
        keys = [self.sheet.cell(0, col_index).value for col_index in xrange(self.sheet.ncols)]
        self.dict_list = []
        for row_index in xrange(1, self.sheet.nrows):
            d = {keys[col_index]: self.sheet.cell(row_index, col_index).value 
                for col_index in xrange(self.sheet.ncols)}
            self.dict_list.append(d)
        self.keyNameofFirstColumn = self.sheet.cell(0, 0).value
        print self.keyNameofFirstColumn
        
    def changeExcelTab(self,tabnameorindex=0):
        if isinstance(tabnameorindex, unicode):
             self.sheet = self.book.sheet_by_name(tabnameorindex)
        else:
             self.sheet = self.book.sheet_by_index(tabnameorindex)
        self._serialize()

    def openExcelFile(self,filepath,tabnameorindex=0):
        self.book = open_workbook(filepath)
        if isinstance(tabnameorindex, unicode):            
             self.sheet = self.book.sheet_by_name(tabnameorindex)
        else:
             self.sheet = self.book.sheet_by_index(tabnameorindex)
        self._serialize()

    def get_dictionary_by_key(self, keyname):
        for obj in self.dict_list:
            if obj['key']==keyname:
                return obj

    def get_first_row_list(self):
        resultList = []
        for col_index in xrange(1,self.sheet.ncols):
            resultList.append(self.sheet.cell(0, col_index).value)            
        return resultList
