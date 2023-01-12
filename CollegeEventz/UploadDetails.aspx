<%@ Page Title="Upload_Event_Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadDetails.aspx.cs" Inherits="CollegeEventz.UploadDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
        <section id="main-content">
        <section id="wrapper">
            <div class="row">
                <div class="col-lg-12" style="left: 0px; top: 20px; height: 600px; text-align: left;">
                    <section class="panel" style="background-color: #FF9933; text-align: left;">
                        <header class="panel-heading" style="padding: 6px 10px 6px 10px; font-family: 'Lucida Fax'; font-size: 25px; color: #FFFFFF">
                            <center>Upload Event Details</center></header>
                         <div class="panel-body" style="border: thin solid #FF9933; background-color : #FFFFFF">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="text-align: left">
                                        <asp:Label Text="Event Title " runat="server" />
                                        <asp:SqlDataSource ID="SqlDataSourcename" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT DISTINCT [eventtitle] FROM [EventRegistrationTable] WHERE ([coordinator] = @coordinator)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="coordinator" SessionField="New" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="eventname" CssClass="form-control input-sm " AppendDataBoundItems="true"  runat="server" DataSourceID="SqlDataSourcename" DataTextField="eventtitle" DataValueField="eventtitle">
                                        <asp:ListItem Text="Select Option" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                        <!--<asp:TextBox ID="eventname1" runat="server" Enabled="true" CssClass="form-control input-sm " placeholder="Event Name" />-->
                                     </div>
                                 </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="text-align: left">
                                        <asp:Label Text="Name " runat="server" />
                                        <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm " placeholder="Name of Faculty member" ID="username" />

                                    </div>
                                </div>
                                </div>
                             <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="text-align: left">
                                        <asp:Label Text="Event-Report " runat="server" />
                                        <asp:FileUpload ID="detailevent" runat="server" Width="100%" />
                                    </div>
                                </div>
                        <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group" style="text-align: left">
                                        <asp:Label Text="Upload Images " runat="server" />
                                        <asp:FileUpload ID="imageevent" runat="server" Width="100%" AllowMultiple="True"  />
                                    </div>
                                </div>
                        </div>
                        
                        </div>
                        <div class="col-sm-3" style="left: 0px; top: 0px; height: 8px"></div>
                        <asp:Button ID="Button3" runat="server" BackColor="#0066FF" BorderColor="White" BorderStyle="Ridge" ForeColor="White" Text="Submit" Width="298px" CssClass="alert-success" Height="32px" OnClick="Button1_Click" />
                        <input id="Reset1" type="reset" value="Reset" style="Width:298px; height:32px; margin-top: 0; color: #FFFFFF; background-color: #FF0000; border-style:ridge" />
                        <br />

                     </section>
                </div>
            </div>

        </section>
        
    </section>
    <div class="text-center" style="margin-top: 0px">
        <asp:Label ID="msg" runat="server" ></asp:Label><br />
        <asp:Label ID="msg1" runat="server" ></asp:Label>

    </div>
</asp:Content>
