<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected OboutInc.Calendar2.Calendar calStart;
	protected OboutInc.Calendar2.Calendar calEnd;
	
	void Page_Init(object o, EventArgs e) {
		calStart = new OboutInc.Calendar2.Calendar();
		calEnd = new OboutInc.Calendar2.Calendar();
		calStart.ID = "startRange";
		calEnd.ID = "endRange";
		startRangePlaceholder.Controls.Add(calStart);
		endRangePlaceholder.Controls.Add(calEnd);
	}

	void Page_Load(object o, EventArgs e) {
		calEnd.BeginDateCalendarId = "startRange";
	}
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
	        <span class="tdText"><b>ASP.NET Calendar - Date range</b></span>
		    <br /><br />	
			<br /><br /> 
		
		    Start date:
		    <ASP:PlaceHolder runat="server" id="startRangePlaceholder" />
		    <br />
		    End date:
		    <ASP:PlaceHolder runat="server" id="endRangePlaceholder" />

		    <br />
    		
		    See also <a href="http://www.obout.com/calendar/tutorial_daterange.aspx">date range tutorial</a>
    		
		    <br /><br /><br />
    		
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">� Back to examples</a>
		    
	    </form>
	</body>
</html>