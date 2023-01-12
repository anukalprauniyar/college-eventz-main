<%@ Page Title="View Event Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewUplodedDetails_teacher.aspx.cs" Inherits="CollegeEventz.ViewUplodedDetails_teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceupload" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" DeleteCommand="DELETE FROM [EventDetailsTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [EventDetailsTable] ([eventname], [eventdetails], [eventimage], [username]) VALUES (@eventname, @eventdetails, @eventimage, @username)" SelectCommand="SELECT * FROM [EventDetailsTable] WHERE ([username] = @username)" UpdateCommand="UPDATE [EventDetailsTable] SET [eventname] = @eventname, [eventdetails] = @eventdetails, [eventimage] = @eventimage, [username] = @username WHERE [Id] = @Id" OnSelecting="SqlDataSource1_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="eventname" Type="String" />
            <asp:Parameter Name="eventdetails" Type="String" />
            <asp:Parameter Name="eventimage" Type="String" />
            <asp:Parameter Name="username" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="New" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="eventname" Type="String" />
            <asp:Parameter Name="eventdetails" Type="String" />
            <asp:Parameter Name="eventimage" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <div class="text-center">
        <br />
      </div>
    <div class="text-center">
    <div class="table-responsive" style="font-family: Arial, Helvetica, sans-serif; font-size: large">
    <asp:GridView ID="GridView1" runat="server" Width="100%" AllowSorting="True" HorizontalAlign="Center" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="10"  Font-Names="Times New Roman" Font-Size="Large" HeaderStyle-BorderStyle="Ridge" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" AllowPaging="True" ForeColor="Black" GridLines="Vertical" Height="100%">
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="Black" Font-Bold="True" ForeColor="White" Height="50px"/>
        
        <AlternatingRowStyle BackColor="#CCCCCC" />
        
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Name">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:Label ID="Label20" runat="server" Text='<%# Eval("eventname") %>'></asp:Label>
                    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("eventname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="Coordinator Name">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("username") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="user" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Event Details">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <div class="text-center">
                        <asp:FileUpload ID="FileUpload1" runat="server" ControlToValidate="FileUpload1" ForeColor="Red" />
                        <br /><asp:Label ID="Label11" runat="server" Text='<%#Eval("eventdetails") %>'></asp:Label>
                    </div>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" Text="View details" NavigateUrl='<%# Eval("eventdetails") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Images">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <div class="text-center">
                        <asp:FileUpload ID="FileUpload2" AllowMultiple="true" runat="server" ControlToValidate="FileUpload2" ForeColor="Red" />
                        <br />
                    </div>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("eventimage") %>'></asp:HyperLink>
                       <a href='viewEventImages.aspx?imagedata=<%# Eval("eventimage") %>'>View Images</a>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Operations">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton3" CausesValidation="false" runat="server" CommandName="Update">Update</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton4" CausesValidation="false" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
        <PagerStyle ForeColor="#0000CC" HorizontalAlign="Center" BackColor="#999999" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        <center><asp:Label ID="Label10" runat="server"></asp:Label></center>

        </div>
        </div>

</asp:Content>
