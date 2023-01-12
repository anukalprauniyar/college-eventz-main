<%@ Page Title="login_page" Language="C#" MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="login_page.aspx.cs" Inherits="CollegeEventz.login_page" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <body>
    <div class ="container">
    <div class="container " style="border: thin solid #CCCCCC; box-shadow: -3px -3px 9px #aaa9a9a2,3px 3px 7px  rgba(147,149,151,0.671); padding: 20px 20px; width:350px; height: 350px; background-color: #C0C0C0; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif;">
  <h2 style="font-size: xx-large; font-family: 'Bookman Old Style'; font-weight: bold; text-align: center; color: #FFFFFF;">Login</h2>
        <form>
            <div class="form-group"  style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: large;" >
                Username<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="Please Enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm " placeholder="Username (ex:AB123)" ID="username" />
           </div>
           <div class="form-group" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: large;" aria-atomic="False">
             <asp:Label Text="Password " runat="server" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
             <asp:TextBox runat="server" Enabled="true" TextMode="Password" CssClass="form-control input-sm " placeholder="Password (ex:AB123)" ID="password"  />
           </div>
       <asp:Button ID="Button1" runat="server" BackColor="#0066FF" BorderColor="White" BorderStyle="Ridge" ForeColor="White" Text="Login" Width="348px" CssClass="alert-success" Height="32px" OnClick="Button1_Click" />
        <div style="align-content:center; font-family: 'Lucida Fax'; font-size: 15px " class="text-center">
                <asp:Label ID="msg" runat="server" ></asp:Label>
                
                
                <br />
                <asp:Label ID="msg1" runat="server" ></asp:Label>
                
            </div>
        </form>
</div>
    </div>
</body>
                          
</asp:Content>

