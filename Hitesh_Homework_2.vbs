Attribute VB_Name = "Module2"

Sub Run_Homework_2_Code():

       Dim J As Integer
           
       
       ' This loop is for counting the number of sheets & activating
       For J = 1 To Worksheets.Count
       
       Sheets(J).Activate
       With ActiveSheet
       
                 
          ' Set an initial variable for holding the
Dim Brand_Name As String


' Set an initial variable for holding the total per credit card brand
Dim Brand_Total As Double
Brand_Total = 0

' Keep track of the location for each credit card brand in the summary table
Dim Summary_Table_Row As Integer
Summary_Table_Row = 2

' Loop through all credit card purchases
For I = 2 To 70926

  ' Check if we are still within the same credit card brand, if it is not...
  If Cells(I + 1, 1).Value <> Cells(I, 1).Value Then

    ' Set the Brand name
    Brand_Name = Cells(I, 1).Value

    ' Add to the Brand Total
    Brand_Total = Brand_Total + Cells(I, 7).Value

    ' Print the Credit Card Brand in the Summary Table
    Range("I" & Summary_Table_Row).Value = Brand_Name

    ' Print the Brand Amount to the Summary Table
    Range("J" & Summary_Table_Row).Value = Brand_Total

    ' Add one to the summary table row
    Summary_Table_Row = Summary_Table_Row + 1
   
    ' Reset the Brand Total
    Brand_Total = 0

  ' If the cell immediately following a row is the same brand...
  Else

    ' Add to the Brand Total

    Brand_Total = Brand_Total + Cells(I, 7).Value
  End If

Next I
     
          ' The following line shows how to reference a sheet within
          ' the loop by displaying the worksheet name in a dialog box.
          'MsgBox ActiveWorkbook.Worksheets(J).Name
End With

       Next J


End Sub

