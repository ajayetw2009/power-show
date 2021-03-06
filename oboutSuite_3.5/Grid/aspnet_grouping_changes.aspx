﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_grouping_changes.aspx.cs" Inherits="Grid_aspnet_grouping_changes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Allow Grouping Changes</b></span>		
	
    <br /><br />
    
    <obout:OboutCheckBox ID="ChkAllowChanges" runat="server" AutoPostBack="true" Text="Allow Changes" /> <br />
               
    <br />
	
    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1" 
        AutoGenerateColumns="false" AllowAddingRecords="false" AllowGrouping="true" GroupBy="ShipCountry">
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" />
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" />            
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />
        </Columns>
        <GroupingSettings AllowChanges="false" />
	</obout:Grid>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders]" />

    <br />

    <span class="tdText">
        Sometimes you need to display grouped records in the Grid but you don't want to allow end users to change the grouping.<br />
        For this reason the Grid provides a property that allows you to disable the grouping feature after the initial grouping is performed.<br />
        Use the <b>GroupingSettings.AllowChanges</b> property to indicate whether you want the end users to be able to change the initial grouping.
    </span>
</asp:Content>

