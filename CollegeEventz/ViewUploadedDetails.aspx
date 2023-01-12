<%@ Page Title="View Event Details" Language="C#" MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="ViewUploadedDetails.aspx.cs" Inherits="CollegeEventz.ViewUploadedDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [EventDetailsTable]"></asp:SqlDataSource>
    <div class="table-responsive" style="font-family: Arial, Helvetica, sans-serif; font-size: large">
    <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Height="100%" >
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ControlStyle-Font-Bold="true">
            
<ControlStyle Font-Bold="True"></ControlStyle>
            
            </asp:BoundField>
            <asp:BoundField DataField="username" HeaderText="Coordinator Name" SortExpression="username"  ControlStyle-Font-Bold="true" >
<ControlStyle Font-Bold="True"></ControlStyle>
            </asp:BoundField>
            <asp:BoundField DataField="eventname" HeaderText="Event Name" SortExpression="eventname"  ControlStyle-Font-Bold="true" >
<ControlStyle Font-Bold="True"></ControlStyle>

            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="eventdetails" HeaderText="Event Details" Text="View details" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
            </asp:HyperLinkField>
            <asp:TemplateField HeaderText="Event Images" ControlStyle-Font-Bold="true">
                <ItemTemplate>
                    <a href='ViewEventImages_student.aspx?imagedata=<%# Eval("eventimage") %>' style="font-weight: bold"">View Images</a>    
                    
                </ItemTemplate>

<ControlStyle Font-Bold="True"></ControlStyle>
            </asp:TemplateField>       
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Height="50px" />
        <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
        </div>
</asp:Content>
