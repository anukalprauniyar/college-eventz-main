<%@ Page Title="Home Page" Language="C#"  MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CollegeEventz._Default" %>
 
  
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
     <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top: 20px">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active" >
                <img src="images/slider13.png" alt="slider1" style="width:100%; height:500px;">
            </div>

            <div class="item">
                <img src="images/slider12.png" alt="img2"  style="width:100%; height:500px;">
            </div>

            <div class="item">
                <img src="images/slider11.png" alt="slider3"  style="width:100%; height:500px;">
            </div>
        </div>
         
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    
    <!-- Container (The Band Section) -->
    <div id="band" class="container text-center">
        <h3>About Activities</h3>
        <p><em>We Appriciate Students growth.</em></p>
        <p>M.J.P. Rohilkhand University Bareilly has a vibrant campus that promotes the personal as well as professional growth of students. Campus life at MJPRU Bareilly is not just about classrooms, libraries and labs. There are various opportunities for students to pursue their favourite activities as also to up-skill themselves. Students at MJPRU get a wholesome environment to further all their academic, cocurricular and extracurricular interests.</p>
        <p>MJP Rohilkhand university Bareilly lays immense stress on holistic development of the students and staff by providing various sporting activities.MJP Rohilkhand University Bareilly has created and maintained excilent sport activities and extensive infrastructure for holding cultural events and other cocarricular activities.The archievements of the students in multiple sports activities is an indication of the dedicated attention, which are mainly promoted through the department of sports since 1976.Sports department is spred over in 20 acres area.

        </p>
        <br>
        
    
        <div class="container" style="box-shadow: -3px -3px 9px #aaa9a9a2,3px 3px 7px  rgba(147,149,151,0.671);">
            <h3 class="text-center">Discover Events</h3>
            <p class="text-center"> </p>
       
            <div class="row text-center">
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img src="images/broucher2.png" alt="MJP" width="100%" height="300">
                        <p><strong>Upcomming Events</strong></p>
                        <asp:Button ID="Button1" runat="server" Text="View" class="btn" OnClick="click1" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img src="images/slider1.jpg" alt="MJP" width="100%" height="300">
                        <p><strong>Previous Events</strong></p>
                        <asp:Button ID="Button2" runat="server" Text="View" class="btn" OnClick="click2" />
                       
                   </div>
                </div>
                </div>
        </div>
        
        
     </div>
</asp:Content>
