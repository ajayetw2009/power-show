<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False
		
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowFiltering = True
        grid1.FolderExports = "resources/exports"
        grid1.ExportingSettings.ExportedFilesLifeTime = 0

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
		AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
		AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
		
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "OrderID"
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ORDER ID"
		oCol1.Width = "100"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
        oCol2.Width = "250"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
		oCol3.Width = "150"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "ShipPostalCode"
		oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipCountry"
		oCol5.HeaderText = "COUNTRY"
		oCol5.Width = "150"

		Dim oCol6 As Column = new Column()
		oCol6.HeaderText = "EDIT"
		oCol6.Width = "125"
        oCol6.AllowEdit = True
        oCol6.AllowDelete = True

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
		
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
				
		If Not Page.IsPostBack Then
			BindGrid()			        
        Else
            grid1.ExportingSettings.ExportedFilesLifeTime = Int32.Parse(ddlLifeTime.SelectedValue)
        End If
    End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
		myConn.Open()
		'Dim da = new OleDbDataAdapter()
		'Dim ds = new DataSet()
		'da.SelectCommand = myComm
		'da.Fill(ds, "Orders")
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()


		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
	End Sub
		
	Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
        
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn)
		
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
  
        myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
		BindGrid()
    End Sub
    
    Protected Sub OboutButton1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim fileName As String = grid1.ExportToExcel()

        Downloader.Text = "The Grid has been exported to an Excel file on the server. <br /><a href=""resources/exports/" + fileName + """>Click here to download the file.</a>"
    End Sub

    Protected Sub OboutButton2_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim fileName As String = grid1.ExportToWord()

        Downloader.Text = "The Grid has been exported to a Word file on the server. <br /><a href=""resources/exports/" + fileName + """>Click here to download the file.</a>"
    End Sub
	</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Setting the Life Time for the Exported files</b></span>
		<br /><br />
		
		
		<table>
		    <tr>
		        <td valign="top">
		            <table border="0">
		                <tr>
		                    <td class="tdText" valign="middle">Delete Previously Exported Files:</td>
		                    <td class="tdText" valign="middle">
		                        <asp:DropDownList runat="server" ID="ddlLifeTime" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="0" Selected="true">Always</asp:ListItem>
		                            <asp:ListItem Value="-1">Never</asp:ListItem>
		                            <asp:ListItem Value="60">After 1 min</asp:ListItem>
		                            <asp:ListItem Value="900">After 15 min</asp:ListItem>
		                            <asp:ListItem Value="1800">After 30 min</asp:ListItem>
		                            <asp:ListItem Value="3600">After 1 h</asp:ListItem>
		                            <asp:ListItem Value="43200">After 12 h</asp:ListItem>
		                            <asp:ListItem Value="86400">After 24 h</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>
		                </tr>		                		                		    		    
		            </table>
		        </td>                
            </tr>
            <tr>
		        <td valign="top" class="tdText">
                    <br /><br />
                    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClick="OboutButton1_Click" />
                    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClick="OboutButton2_Click" />

                    <br /><br />

                    <asp:Literal runat="server" ID="Downloader" />
		        </td>
		    </tr>
		</table>	
		
		<br /><br />	
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<div class="tdText">
    		Use the <b>ExportingSettings.ExportedFilesLifeTime</b> property to set the life time of the previously exported files.<br />
    		Each time a new file is created the Grid will <b>automatically delete</b> the previously exported files <br />
    		with the life time expired from the server.
    		<br /><br />
    		Open the <b>grid/resources/exports</b> folder to see how the files are deleted.
    		<br />
    		<br />
    		Possible values for the <b>ExportingSettings.ExportedFilesLifeTime</b> property
    		<ul>
    		    <li><b>0</b> - delete all previously exported files</li>
    		    <li><b>-1</b> - delete no files</li>
    		    <li>any other value - delete all the files older than the specified number of <b>seconds</b></li>
    		</ul>
		</div>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">� Back to examples</a>
		
		</form>
	</body>
</html>