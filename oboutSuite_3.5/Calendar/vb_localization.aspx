<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	Dim myCal As OboutInc.Calendar2.Calendar
	
	Sub Page_Init(o As object, e As EventArgs)
		myCal = new OboutInc.Calendar2.Calendar()
		myCal.ID = "calendar"
		myCalPlaceholder.Controls.Add(myCal)
	End Sub

	Sub Page_Load(o As object, e As EventArgs)
		myCal.CultureName = "es-ES"
	End Sub
</script>

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
	        <span class="tdText"><b>ASP.NET Calendar - Localization</b></span>
		    <br /><br />	
			<br /><br /> 

		    You may set <b>CultureName</b> property to any allowed value:
		    <br /><br />
		    <ASP:PlaceHolder runat="server" id="myCalPlaceholder" />

		    <br />
    		
		    See also <a href="http://www.obout.com/calendar/tutorial_localization.aspx">localization tutorial</a>
    		
		    <br /><br /><br />
    		
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VBNET">� Back to examples</a>
		    
		 </form>  
	</body>
</html>