import xlrd

filePath = "C:\\Users\\gerar\\Downloads\\reglas.xls"

openFile = xlrd.open_workbook(filePath)

sheet = openFile.sheet_by_name("Hoja1")
f = open ('reglas.txt','w')

for i in range(sheet.nrows):
    f.write("dieta"+"("+"'"+sheet.cell_value(i, 0)+"'"+","+"'"+sheet.cell_value(i, 1)+"'"+","+"'"+sheet.cell_value(i, 2)+"'"+","+"'"+sheet.cell_value(i,3)+"'"+","+"'"+sheet.cell_value(i,4)+"'"+","+"'"+sheet.cell_value(i,5)+"'"+","+"'"+sheet.cell_value(i,6)+"'"+")"+"."+"\n")

f.close()