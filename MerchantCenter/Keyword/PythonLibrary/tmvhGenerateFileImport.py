from datetime import datetime, timedelta
import xlwt
import os

def gen_import_file(file_path):
    style0 = xlwt.easyxf('font: name Times New Roman, color-index red, bold on',
        num_format_str='#,##0.00')
   
    style1 = xlwt.easyxf(num_format_str='DMHms')
    
    wb = xlwt.Workbook()
    ws = wb.add_sheet('1')

    ws.write(0, 0, "Phone_Number")
    ws.write(0, 1, "Number_Type")
    ws.write(0, 2, "Propo_Type")
    ws.write(0, 3, "Expired_Date")
    ws.write(0, 4, "Pattern")
    ws.write(0, 5, "Company Code")

    m = datetime.now().strftime('%m%w%H%M%S');

    for x in range(0, 3):
        
        ws.write(x + 1, 0, m + str(x))
        ws.write(x + 1, 1, "Gold")
        ws.write(x + 1, 2, "0020949")
        ws.write(x + 1, 3, "19/12/2016 00:00:00")
        ws.write(x + 1, 4, "xxxy")
        ws.write(x + 1, 5, "WEM")

        last_phone_number= m + str(x)


    wb.save(file_path)
    return last_phone_number

def gen_import_file_not_expire(file_path):

    style0 = xlwt.easyxf('font: name Times New Roman, color-index red, bold on',
        num_format_str='#,##0.00')
    style1 = xlwt.easyxf(num_format_str='DMHms')
    
    wb = xlwt.Workbook()
    ws = wb.add_sheet('1')

    ws.write(0, 0, "Phone_Number")
    ws.write(0, 1, "Number_Type")
    ws.write(0, 2, "Propo_Type")
    ws.write(0, 3, "Expired_Date")
    ws.write(0, 4, "Pattern")
    ws.write(0, 5, "Company Code")

    m = datetime.now().strftime('%d%w%H%M%S');
    t = datetime.now() + timedelta(days=1)
    tomorrow = t.strftime('%d/%m/%Y %H:%I:%S')

    for x in range(0, 3):
        ws.write(x + 1, 0, m + str(x))
        ws.write(x + 1, 1, "Gold")
        ws.write(x + 1, 2, "0020949")
        ws.write(x + 1, 3, tomorrow)
        ws.write(x + 1, 4, "xxxy")
        ws.write(x + 1, 5, "WEM")

    wb.save(file_path)

def remove_import_file(file_path):
    os.remove(file_path)
