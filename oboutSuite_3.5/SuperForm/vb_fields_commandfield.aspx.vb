﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class SuperForm_vb_fields_commandfield
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Dim SuperForm2 As Obout.SuperForm.SuperForm
    Dim SuperForm3 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.Title = "Order Details"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateDateFields = True
        Dim keyNames1() As String = {"OrderID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit

        Dim field11 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field11.DataField = "OrderID"
        field11.HeaderText = "Order ID"
        field11.ReadOnly = True
        field11.InsertVisible = False

        Dim field12 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field12.DataField = "ShipName"
        field12.HeaderText = "Ship Name"

        Dim field13 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field13.DataField = "ShipCity"
        field13.HeaderText = "Ship City"

        Dim field14 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field14.DataField = "ShipCountry"
        field14.HeaderText = "Ship Country"

        Dim field15 As Obout.SuperForm.CommandField = New Obout.SuperForm.CommandField()
        field15.ButtonType = ButtonType.Button
        field15.ShowEditButton = True
        field15.ShowDeleteButton = True
        field15.ShowInsertButton = True

        SuperForm1.Fields.Add(field11)
        SuperForm1.Fields.Add(field12)
        SuperForm1.Fields.Add(field13)
        SuperForm1.Fields.Add(field14)
        SuperForm1.Fields.Add(field15)


        SuperForm1Container.Controls.Add(SuperForm1)

        SuperForm2 = New SuperForm()
        SuperForm2.ID = "SuperForm2"
        SuperForm2.Title = "Order Details"
        SuperForm2.DataSourceID = "SqlDataSource1"
        SuperForm2.AutoGenerateRows = False
        SuperForm2.AutoGenerateDateFields = True
        Dim keyNames2() As String = {"OrderID"}
        SuperForm2.DataKeyNames = keyNames2
        SuperForm2.AllowPaging = True
        SuperForm2.DefaultMode = DetailsViewMode.Edit

        Dim field21 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field21.DataField = "OrderID"
        field21.HeaderText = "Order ID"
        field21.ReadOnly = True
        field21.InsertVisible = False

        Dim field22 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field22.DataField = "ShipName"
        field22.HeaderText = "Ship Name"

        Dim field23 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field23.DataField = "ShipCity"
        field23.HeaderText = "Ship City"

        Dim field24 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field24.DataField = "ShipCountry"
        field24.HeaderText = "Ship Country"

        Dim field25 As Obout.SuperForm.CommandField = New Obout.SuperForm.CommandField()
        field25.ButtonType = ButtonType.Link
        field25.ShowEditButton = True
        field25.ShowDeleteButton = True
        field25.ShowInsertButton = True

        SuperForm2.Fields.Add(field21)
        SuperForm2.Fields.Add(field22)
        SuperForm2.Fields.Add(field23)
        SuperForm2.Fields.Add(field24)
        SuperForm2.Fields.Add(field25)

        SuperForm2Container.Controls.Add(SuperForm2)

        SuperForm3 = New SuperForm()
        SuperForm3.ID = "SuperForm3"
        SuperForm3.Title = "Order Details"
        SuperForm3.DataSourceID = "SqlDataSource1"
        SuperForm3.AutoGenerateRows = False
        SuperForm3.AutoGenerateDateFields = True
        Dim keyNames3() As String = {"OrderID"}
        SuperForm3.DataKeyNames = keyNames3
        SuperForm3.AllowPaging = True
        SuperForm3.DefaultMode = DetailsViewMode.Edit

        Dim field31 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field31.DataField = "OrderID"
        field31.HeaderText = "Order ID"
        field31.ReadOnly = True
        field31.InsertVisible = False

        Dim field32 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field32.DataField = "ShipName"
        field32.HeaderText = "Ship Name"

        Dim field33 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field33.DataField = "ShipCity"
        field33.HeaderText = "Ship City"

        Dim field34 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field34.DataField = "ShipCountry"
        field34.HeaderText = "Ship Country"

        Dim field35 As Obout.SuperForm.CommandField = New Obout.SuperForm.CommandField()
        field35.ButtonType = ButtonType.Image
        field35.ShowEditButton = True
        field35.ShowDeleteButton = True
        field35.ShowInsertButton = True
        field35.EditImageUrl = "resources/icons/Edit.png"
        field35.DeleteImageUrl = "resources/icons/Delete.png"
        field35.NewImageUrl = "resources/icons/Add.png"
        field35.InsertImageUrl = "resources/icons/Save.png"
        field35.UpdateImageUrl = "resources/icons/Save.png"
        field35.CancelImageUrl = "resources/icons/Delete.png"

        SuperForm3.Fields.Add(field31)
        SuperForm3.Fields.Add(field32)
        SuperForm3.Fields.Add(field33)
        SuperForm3.Fields.Add(field34)
        SuperForm3.Fields.Add(field35)

        SuperForm3Container.Controls.Add(SuperForm3)

    End Sub
End Class
