Attribute VB_Name = "Módulo1"
#If Win64 Then
        Private Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal Milisegundos As LongPtr)
    #ElseIf Win32 Then
        Private Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal Milisegundos As Long)
    #End If

Sub Buscar()
Dim Nom As Workbook
Dim Salida1
Dim Salida2
Dim preciox
Dim Contarx
Dim xcliente
Dim Xnotas As String



TotalRegistros = ActiveSheet.Range("A" & Rows.Count).End(xlUp).Row

'Evalua que el archivo Empleados este abierto
Abierto = 0
For Each Nom In Workbooks
    If Nom.Name = "productos.xlsm" Then
    Abierto = 1
    End If
Next Nom
If Abierto = 0 Then
'Workbooks.Open Filename:="\\192.68.1.14\MODELO_NOTAS\productos.xlsm"
Workbooks.Open Filename:="C:\MODELO_NOTAS\productos.xlsm"
'MsgBox "Favor Minimizar este Archivo <PRODUCTOS> "

'ActiveWindow.WindowState = xlMinimized
Application.WindowState = xlMinimized
Application.DisplayFullScreen = False
'Sheets("Sheet1").Select


Exit Sub
End If

'MsgBox (TotalRegistros)
J = 24
g = 0
Do While J <= TotalRegistros

Salida1 = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("productos").Range("A2:F6201"), 6, False)
Salida2 = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("productos").Range("A2:F6201"), 3, False)

    If IsError(Salida1) Then
        Sheets("Hoja1").Cells(J, 2) = ""
        Sheets("Hoja1").Cells(J, 3) = ""
    Else
        Sheets("Hoja1").Cells(J, 2) = Salida1
        Sheets("Hoja1").Cells(J, 3) = Salida2
       
    End If
    


xcliente = Range("g4")

If xcliente = "1" Then
Salida3 = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("precios").Range("A2:v3402"), 5, False)

    If IsError(Salida3) Then
        Sheets("Hoja1").Cells(J, 6) = ""
     Else
        Sheets("Hoja1").Cells(J, 6) = Salida3
        Sheets("Hoja1").Cells(J, 7) = Salida3 * Sheets("Hoja1").Cells(J, 4)
     End If
Else
        If xcliente = "2" Then
        Salida3 = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("precios").Range("A2:v3402"), 6, False)
        
            If IsError(Salida3) Then
                Sheets("Hoja1").Cells(J, 6) = ""
             Else
                Sheets("Hoja1").Cells(J, 6) = Salida3
                Sheets("Hoja1").Cells(J, 7) = Salida3 * Sheets("Hoja1").Cells(J, 4)
            End If
        Else
                If xcliente = "3" Then
                Salida3 = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("precios").Range("A2:v3402"), 7, False)
                
                    If IsError(Salida3) Then
                        Sheets("Hoja1").Cells(J, 6) = ""
                    Else
                        Sheets("Hoja1").Cells(J, 6) = Salida3
                        Sheets("Hoja1").Cells(J, 7) = Salida3 * Sheets("Hoja1").Cells(J, 4)
                    End If
                    
                Else
                        If xcliente = "4" Then
                        Salida3 = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("precios").Range("A2:v3402"), 8, False)
                        
                            If IsError(Salida3) Then
                                Sheets("Hoja1").Cells(J, 6) = ""
                            Else
                                Sheets("Hoja1").Cells(J, 6) = Salida3
                                Sheets("Hoja1").Cells(J, 7) = Salida3 * Sheets("Hoja1").Cells(J, 4)
                            End If
             
                         Else
                                   If xcliente = "5" Then
                                   Salida3 = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("precios").Range("A2:v3402"), 9, False)
                                   
                                       If IsError(Salida3) Then
                                           Sheets("Hoja1").Cells(J, 6) = ""
                                       Else
                                           Sheets("Hoja1").Cells(J, 6) = Salida3
                                           Sheets("Hoja1").Cells(J, 7) = Salida3 * Sheets("Hoja1").Cells(J, 4)
                                       End If
                        
                          End If
                          
                 End If
             End If
        End If
End If


Sleep (1)
J = J + 1
g = g + 1
Range("i4") = g


Loop

'Sheets("Hoja1").Cells(J, 2) = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("productos").Range("A2:F6201"), 6, False)
'Sheets("Hoja1").Cells(J, 3) = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("productos").Range("A2:F6201"), 3, False)
'Sheets("Hoja1").Cells(J, 4) = Application.VLookup(Sheets("Hoja1").Cells(J, 1), Application.Workbooks("productos.xlsm").Worksheets("productos").Range("A2:F6201"), 4, False)

MsgBox ("Actualizado")

End Sub

