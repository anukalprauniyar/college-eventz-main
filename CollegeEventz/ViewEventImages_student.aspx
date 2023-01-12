<%@ Page Title="ViewEventsImages" Language="C#" MasterPageFile="~/NewSite.Master" AutoEventWireup="true" CodeBehind="ViewEventImages_student.aspx.cs" Inherits="CollegeEventz.ViewEventImages_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="text-align:center">
<center>
           <asp:ListView ID="ListView1" runat="server"  GroupItemCount="2"  style=" border:hidden; padding:inherit; " >
               
            
               <EmptyDataTemplate>
                   <table runat="server" >
                       <tr>
                           <td>No data was returned.</td>
                       </tr>
                   </table>
               </EmptyDataTemplate>
               <EmptyItemTemplate>
<td runat="server" />
               </EmptyItemTemplate>
               <GroupTemplate>
                   <tr id="itemPlaceholderContainer" runat="server">
                       <td id="itemPlaceholder" runat="server"></td>
                   </tr>
               </GroupTemplate>
               <ItemTemplate>
                   <td runat="server" style="padding:20px; table-layout: auto;">
                       
                       <asp:HyperLink ID="ImageButton1" NavigateUrl='<%# Container.DataItem %>' runat="server">
                       <asp:Image ID="ImageButton2" runat="server" ImageUrl='<%# Container.DataItem %>' Height="350" Width="500" OnClientClick="return LoadDiv(this.src)" ></asp:Image>
                       </asp:HyperLink>
                       
                       <br />
                       <br /></td>
                   
                </ItemTemplate>

               <LayoutTemplate >
                   <table runat="server">
                       <tr runat="server">
                           <td runat="server">
                               <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                   <tr id="groupPlaceholder" runat="server">
                                   </tr>
                               </table>
                           </td>
                       </tr>
                       <br />
                       <br />
                       <tr runat="server">
                           <td runat="server" style="table-layout: auto; text-align: center">
                               <br />
                               <asp:DataPager ID="DataPager1" runat="server" PageSize="12">

                                   <Fields>
                                       <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="False" ShowLastPageButton="False" ButtonCssClass="auto-style1" Visible="True" RenderDisabledButtonsAsLabels="False"  />
                                   </Fields>
                               </asp:DataPager>
                           </td>
                       </tr>
                   </table>
               </LayoutTemplate> 
           </asp:ListView>
    </center>
       </div>
</asp:Content>
