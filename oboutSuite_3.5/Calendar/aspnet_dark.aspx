<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Calendar examples</title>

	    <style type="text/css">
			
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
			body {
				font:11px Verdana;
				color:#333333;
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
		<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Calendar - Dark style</b></span>
		    <br /><br />	
			<br /><br /> 
			
			<obout:Calendar runat="server"
							StyleFolder = "styles/dark"
							MonthWidth="147" 
							MonthHeight="133" />

			<br />
			Date picker
			<ASP:TextBox runat="server" id="txtDate" />
			<obout:Calendar runat="server"
							StyleFolder = "styles/dark"
							DatePickerMode = "true"
							TextBoxId = "txtDate"
							DatePickerImagePath = "styles/icon2.gif"
							MonthWidth="147" 
							MonthHeight="133" />
			
			 <br /><br /><br /><br /><br />
    	    
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">� Back to examples</a>
	        
	    </form>
	</body>
</html>