<%@ Page Title="Event Registeration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register_Event.aspx.cs" Inherits="CollegeEventz.Register_Event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section id="main-content">
        <section id="wrapper">
            <div class="row">
                <div class="col-lg-12" style="left: 0px; top: 20px; height: 600px">
                    <section class="panel" style="background-color: #FF9933">
                        <header class="panel-heading" style="padding: 6px 10px 6px 10px; font-family: 'Lucida Fax'; font-size: 25px; color: #FFFFFF">
                            <center>Event Registration</center>
                        </header>

                        <div class="panel-body" style="border: thin solid #FF9933; background-color: #FFFFFF">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="color: #FF0000">
                                        <asp:Label Text="Event-Title " runat="server" style="color: #000000"/>*
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="eventtitle" ErrorMessage="Please Enter Event-Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                       <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm " placeholder="Event Name" ID="eventtitle" />
                                    </div>
                                 </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="color: #FF0000">
                                        <asp:Label Text="Start Date " runat="server" style="color: #000000"/>*
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="startdate" ErrorMessage="Please Select Start Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                       <asp:TextBox runat="server" Enabled="true" TextMode="Date" CssClass="form-control input-sm " placeholder="Start Date" ID="startdate"/>
                                    </div>
                                </div>
                             </div>
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="color: #FF0000">
                                        <asp:Label Text="End Date " runat="server" style="color: #000000"/>*
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="enddate" ErrorMessage="Please Select End Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                       <asp:TextBox runat="server" Enabled="true" TextMode="Date" CssClass="form-control input-sm " placeholder="End Date" ID="enddate"/>
                                    </div>
                                </div> 
                                                      
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="color: #FF0000">
                                        <asp:Label Text="Event Theme " runat="server" style="color: #000000"/>*
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="eventtheme" ErrorMessage="Please Enter the Event Theme" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm " placeholder="Event Theme" ID="eventtheme"  />
                     
                                   </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="color: #FF0000">
                                        <asp:Label Text="URL " runat="server" style="color: #000000"/>
                                        <asp:TextBox runat="server" Enabled="true" TextMode="Url" CssClass="form-control input-sm " placeholder="URL" ID="url" />
                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <div style="color:red">
                                        <asp:Label Text="Upload Brochour " runat="server" style="color: #000000"/>
                                        </div>
                                        <asp:FileUpload ID="boucher" runat="server" Width="888px"/>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="color: #FF0000">
                                        <asp:Label Text="Name of Department " runat="server" style="color: #000000"/>*
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="department" InitialValue="0" ErrorMessage="Please Select the Department" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT distinct([Department]) FROM [FacultyDataTable]"></asp:SqlDataSource>

                                        <br />
                                        <asp:DropDownList ID="department" CssClass="form-control input-sm " AppendDataBoundItems="true"  runat="server" DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="Department" >
                                        <asp:ListItem Value="0" Text="Select Option"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="color: #FF0000">
                                        <asp:Label Text="Select Quarter " runat="server" style="color: #000000"/>*
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="quarter" ErrorMessage="Please Select a Quarter The Event" ForeColor="Red" InitialValue="Select Option"></asp:RequiredFieldValidator>
                                  <asp:DropDownList ID="quarter" CssClass="form-control input-sm "  runat="server" required="please select">
                                            <asp:ListItem >Select Option</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                          </asp:DropDownList></div>
                                </div>
                                </div>
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="color: #FF0000">
                                        <asp:Label Text="Name Of Coordinator " runat="server" style="color: #000000"/>*
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="coordinator" ErrorMessage="Please Enter the Coordinator " ForeColor="Red"></asp:RequiredFieldValidator>
                                       <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm " placeholder="Name of Faculty member" ID="coordinator" />
                                    </div>
                                </div> 
                            </div>
                  
                        <div class="col-sm-3" style="left: 0px; top: 0px; height: 8px"></div>
                        <strong>
                        <asp:Button ID="Button1" runat="server" BackColor="#0066FF" BorderColor="White" BorderStyle="Ridge" ForeColor="White" Text="Submit" Width="298px" CssClass="alert-success" Height="32px" OnClick="Button1_Click" />
                        <input id="Reset1" type="reset" value="Reset" style="Width:298px; height:32px; margin-top: 0; color: #FFFFFF; background-color: #FF0000; border-style:ridge" />

                        </strong> 
                            </
                    </section>
                </div>
            
            <div style="align-content:center; font-family: 'Lucida Fax'; font-size: 15px " class="text-center">
                <asp:Label ID="msg" runat="server" ></asp:Label>
            </div>
            </div>
        </section>
    </section>



</asp:Content>
