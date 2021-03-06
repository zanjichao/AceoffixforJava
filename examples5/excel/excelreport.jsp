<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.acesoft.aceoffix.*, com.acesoft.aceoffix.excelwriter.*, java.awt.*"%>

<%
AceoffixCtrl aceCtrl1 = new AceoffixCtrl(request);
aceCtrl1.setServerPage("../server.ace"); //Required

aceCtrl1.setMenubar(false);
aceCtrl1.setOfficeToolbars(false);
aceCtrl1.setTheme(ThemeType.Office2010);
aceCtrl1.setBorderStyle(BorderStyleType.BorderThin);

Workbook wb = new Workbook();
Sheet sheet1 = wb.openSheet("Sheet1");
Table tableRange1 = sheet1.openTable("C5:E16");

//Output data into the table.
Random r = new Random();
for (int j = 0; j < 12; j++){
    for (int i = 0; i < tableRange1.getDataFields().size(); i++){
        int iValue = (r.nextInt(25) + 10) * 1000;
        tableRange1.getDataFields().get(i).setValue(String.valueOf(iValue)); // You can set the data from the database.
        if (iValue > 30 * 1000){ // If the value is greater than 30*1000, then the cell will display alert style to warn the user.
            tableRange1.getDataFields().get(i).setBackColor(Color.red);
            tableRange1.getDataFields().get(i).setForeColor(Color.yellow);
        }
    }
    tableRange1.nextRow();
}
tableRange1.close();

// Create custom toolbar
aceCtrl1.addCustomToolButton("Save As", "SaveAsDocument()", 1);
aceCtrl1.addCustomToolButton("-", "", 0);
aceCtrl1.addCustomToolButton("Page Setup", "ShowPageSetupDlg()", 0);
aceCtrl1.addCustomToolButton("Print", "ShowPrintDlg()", 6);
aceCtrl1.addCustomToolButton("-", "", 0);
aceCtrl1.addCustomToolButton("Full-screen Switch", "SwitchFullScreen()", 4);

aceCtrl1.setCaption("Subject: Usage of Excel Table [Double click the title bar to enter/exit full screen]");
aceCtrl1.setFileTitle("Report1");
aceCtrl1.bind(wb);      
aceCtrl1.openDocument("../doc/xls-report.xls", OpenModeType.xlsReadOnly, "John Scott"); // docReadOnly: Disabled Edit, Paste.

%>

<!DOCTYPE HTML>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js"><!--<![endif]--><head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale = 1.0, user-scalable = no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<title>Acesoft Corporation - Generate Excel spreadsheet dynamically</title>

<!-- Theme styles -->
<link href="../css/acestyle.css" rel="stylesheet">
<link rel='stylesheet' id='contact-form-7-css'  href='../css/styles.css?ver=4.2.2' type='text/css' media='all' />
</head>

<body>
<!--[if lt IE 7]>
	<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
	<![endif]-->

<div id="banner-wrap" class="clearfix">
	<div id="top-nav" class="container clearfix">
        <div class="grid_10 center alpha">
        	Web Development Platform for Microsoft Office
        </div>
        <div class="grid_2 right omega">
        	<a href="http://www.aceoffix.com/index.php/contact-us/"><img src="../image/contactw.png" alt="contact">&nbsp;&nbsp;Contact Us</a>
        </div>
	</div>
    <div id="nav-wrap" class="clearfix">
        <div class="container">
            <div id="logo" class="grid_3 alpha"><a href="http://www.aceoffix.com"><img src="../image/aceoffixlogo.png" height="48" width="229" alt="Aceoffix" class="scale-with-grid" /></a></div>
            <div class="grid_9 omega">
                <nav class="nav">
                    <ul class="nav-list"><li class="page_item page-item-2 current_page_item menu-item-8"><a href="http://www.aceoffix.com/">Home</a></li>
<li class="page_item menu-item-244"><a href="http://www.aceoffix.com/index.php/overview/">Products</a>
</li>
<li class="page_item menu-item-224"><a href="http://www.aceoffix.com/index.php/download/">Download</a>
</li>
<li class="page_item menu-item-236"><a href="http://www.aceoffix.com/index.php/recent-update/">Support</a>
</li>
<li class="page_item menu-item-205"><a href="http://www.aceoffix.com/index.php/purchase/">Purchase</a>
</li>
<li class="page_item menu-item-17"><a href="http://www.aceoffix.com/index.php/about-us/">About Us</a></li>
</ul>                </nav>
            </div>
        </div>
    </div>


    <div id="title-wrap" class="clearfix">
        <div class="container left">
        Current Page:  Example Center
            <h1>Example Center - Aceoffix V5</h1>
            
        </div>
    </div>
    		
    </div>
    <br/>
    <div class="container left">
        <div class="left"><span>Current Page: <a href="../index.jsp" title="Examples Center">Example Center</a> &gt;</span><span><strong><em>Generate Excel spreadsheet dynamically</em></strong></span></div>
        <div class="right">
            
        </div>
        <div class="clear"></div>
    </div>

	<div class="container left">
<!--************** Start of AceoffixCtrl JavaScript ************************-->

<script language="javascript" type="text/javascript">
	function SaveAsDocument() {
	    document.getElementById("AceoffixCtrl1").ShowDialog(3); //Save file to local computer
	}
	function ShowPageSetupDlg() {
	    document.getElementById("AceoffixCtrl1").ShowDialog(5); //Page setup dialog box
	}
	function ShowPrintDlg() {
	    document.getElementById("AceoffixCtrl1").ShowDialog(4); //Print dialog box
	}
	function SwitchFullScreen() {
	    document.getElementById("AceoffixCtrl1").FullScreen = !document.getElementById("AceoffixCtrl1").FullScreen;
	}
</script>

<!--************** End of AceoffixCtrl JavaScript ************************-->
  <div style="width:auto; height:600px;">
      <%= aceCtrl1.getHtmlCode("AceoffixCtrl1")%>
  </div>

			       </div><br/>
 
<div id="quicklink-wrap" class="clearfix">
	<div class="container">
    	<h1>Quick Link</h1>
       <div class="footer-column grid_3 alpha">
       		<h3>Product</h3>
			<a href="http://www.aceoffix.com/index.php/overview/">Overview</a>
<a href="http://www.aceoffix.com/index.php/functions-features/">Functions &#038; Features</a>
<a href="http://www.aceoffix.com/index.php/trial-license/">Trial &#038; License</a>
<a href="http://www.aceoffix.com/index.php/purchase/">Purchase</a>
       </div>
       <div class="footer-column grid_3 mobile-omega2">
			<h3>Download</h3>
			<a href="http://www.aceoffix.com/index.php/download/">Aceoffix for ASP.NET</a>
<a href="http://www.aceoffix.com/index.php/download/">Aceoffix for JAVA</a>
<a href="http://www.aceoffix.com/index.php/download/">Aceoffix for PHP</a>
       </div>
       <div class="footer-column grid_3 mobile-alpha2">
			<h3>Support</h3>
			<a href="http://www.aceoffix.com/index.php/technical-faq/">Technical FAQ</a>
<a href="http://www.aceoffix.com/index.php/videos/">Videos</a>
<a href="http://www.aceoffix.com/index.php/recent-update/">Recent Update</a>
       </div>
       <div class="footer-column grid_3 omega">
			<h3>Follow Us</h3>
			<a href="https://www.facebook.com/Aceoffix-152929314763836/">Facebook</a>
<a href="https://twitter.com/Aceoffix">Twitter</a>
       </div>
    </div>
</div>

<div id="footer-wrap" class="clearfix">
    <div class="container center">
		<a href="http://www.aceoffix.com/">Home</a>
<a href="http://www.aceoffix.com/index.php/acesoft-customer-privacy-policy/">Privacy Policy</a>
<a href="http://www.aceoffix.com/index.php/acesoft-terms-of-use/">Terms of Use</a>
<a href="http://www.aceoffix.com/index.php/contact-us/">Contact Us</a>
<a href="http://www.aceoffix.com/index.php/sitemap/">Sitemap</a>
		<br>
				&copy; 2018 Acesoft Corporation. All rights reserved.
    </div>
</div>

</body>
</html>