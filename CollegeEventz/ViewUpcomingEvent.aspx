<%@ Page Title="" Language="C#" MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="ViewUpcomingEvent.aspx.cs" Inherits="CollegeEventz.ViewUpcomingEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  

    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [EventRegistrationTable] WHERE startdate = cast(getdate() as Date) OR startdate > getdate();"> </asp:SqlDataSource>
     <div class="table-responsive" style="font-family: Arial, Helvetica, sans-serif; font-size: large">
    <center><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="100%" Width="100%">
        <AlternatingRowStyle BackColor="#CCCCCC" />



    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:BoundField>
        <asp:BoundField DataField="eventtitle" HeaderText="Event Title" SortExpression="eventtitle" ControlStyle-Font-Bold="true" >
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:BoundField>
        <asp:BoundField DataField="startdate" HeaderText="Start Date" SortExpression="startdate" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:BoundField>
        <asp:BoundField DataField="enddate" HeaderText="End Date" SortExpression="enddate" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:BoundField>
        <asp:BoundField DataField="eventtheme" HeaderText="Event Theme" SortExpression="eventtheme" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:BoundField>
        <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:BoundField>
        <asp:BoundField DataField="quarter" HeaderText="Quarter" SortExpression="quarter" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:BoundField>
        <asp:BoundField DataField="coordinator" HeaderText="Coordinator" SortExpression="coordinator" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:BoundField>
        <asp:HyperLinkField DataNavigateUrlFields="url" HeaderText="Event Url" Text="View Url" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:HyperLinkField>
        <asp:HyperLinkField DataNavigateUrlFields="brochour" HeaderText="Brochour" Text="View Brochour" ControlStyle-Font-Bold="true">
<ControlStyle Font-Bold="True"></ControlStyle>
        </asp:HyperLinkField>
    </Columns>
    <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" VerticalAlign="Middle" />
    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerSettings NextPageText="Next" PreviousPageText="Previous" />
    <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" Font-Names="Arial" Font-Underline="True" Wrap="False" />
    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#808080" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </center>
    </div>
</asp:Content>
