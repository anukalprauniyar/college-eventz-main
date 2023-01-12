<%@ Page Title="View Event Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRegistrationData.aspx.cs" Inherits="CollegeEventz.ViewRegistrationData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="format">
        <div>
            <asp:Label Text="Start Date " runat="server" style="color: #000000"/>
            <asp:TextBox runat="server" Enabled="true" TextMode="Date" CssClass="form-control input-sm " placeholder="Start Date" ID="startdate"/>
        </div>
        <div>
            <asp:Label Text="End Date " runat="server" style="color: #000000"/> 
            <asp:TextBox runat="server" Enabled="true" TextMode="Date" CssClass="form-control input-sm " placeholder="End Date" ID="enddate"/>
        </div>    
            <asp:Button  runat="server" BackColor="#0066FF" BorderColor="White" BorderStyle="Ridge" ForeColor="White" Text="Search" Width="298px" CssClass="alert-success" Height="32px" OnClick="Unnamed3_Click"  />            
    </div>
    
    
    <div class="text-center">
    <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [EventRegistrationTable] WHERE ([coordinator] = @coordinator)" DeleteCommand="DELETE FROM [EventRegistrationTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [EventRegistrationTable] ([eventtitle], [startdate], [enddate], [eventtheme], [url], [brochour], [department], [quarter], [coordinator]) VALUES (@eventtitle, @startdate, @enddate, @eventtheme, @url, @brochour, @department, @quarter, @coordinator)" UpdateCommand="UPDATE [EventRegistrationTable] SET [eventtitle] = @eventtitle, [startdate] = @startdate, [enddate] = @enddate, [eventtheme] = @eventtheme, [url] = @url, [brochour] = @brochour, [department] = @department, [quarter] = @quarter, [coordinator] = @coordinator WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="eventtitle" Type="String" />
            <asp:Parameter Name="startdate" Type="String" />
            <asp:Parameter Name="enddate" Type="String" />
            <asp:Parameter Name="eventtheme" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="brochour" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="quarter" Type="String" />
            <asp:Parameter Name="coordinator" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="coordinator" SessionField="New" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="eventtitle" Type="String" />
            <asp:Parameter Name="startdate" Type="String" />
            <asp:Parameter Name="enddate" Type="String" />
            <asp:Parameter Name="eventtheme" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="brochour" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="quarter" Type="String" />
            <asp:Parameter Name="coordinator" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>
    <div class="text-center">
    <div class="table-responsive" style="font-family: Arial, Helvetica, sans-serif; font-size: large">
    <asp:GridView ID="GridView1" runat="server" Width="100%" AllowSorting="True" HorizontalAlign="Center" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"  Font-Names="Times New Roman" Font-Size="Large" HeaderStyle-BorderStyle="Ridge" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" ForeColor="Black" GridLines="Vertical" Height="100%">
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
            <asp:TemplateField HeaderText="Event Title">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("eventtitle") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("eventtitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start Date">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("startdate") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:label ID="Label3" runat="server" Text='<%# Eval("startdate") %>'></asp:label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("enddate") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("enddate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Theme">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Eval("eventtheme") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("eventtheme") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Department">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:Label ID="Label26" runat="server" Text='<%# Eval("department") %>'></asp:Label>                   
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("department") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quarter">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Eval("quarter") %>'>
                        <asp:ListItem>Select Option</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("quarter") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Coordinator Name">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("coordinator") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("coordinator") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event URL">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("url") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text="Event Url" NavigateUrl='<%# Eval("url") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Brochour">
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <div class="text-center">
                        <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="Red" OnDataBinding='<%#Eval("brochour") %>' />
                        <br /><asp:Label ID="Label11" runat="server" Text='<%#Eval("brochour") %>'></asp:Label>
                    </div>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" Text="View brochour" NavigateUrl='<%# Eval("brochour") %>'></asp:HyperLink>
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
        
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
        <SelectedRowStyle BackColor="#999999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        <center><asp:Label ID="Label10" runat="server"></asp:Label></center>

        </div>
        </div>

</div>
</asp:Content>
