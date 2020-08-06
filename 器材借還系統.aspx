<%@ Page Language="C#" AutoEventWireup="true" CodeFile="器材借還系統.aspx.cs" Inherits="器材借還系統" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>
            <asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="1.0em" ForeColor="#990000" Orientation="Horizontal" StaticSubMenuIndent="12px" OnMenuItemClick="Menu1_MenuItemClick">
                <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#FFFBD6" />
                <DynamicSelectedStyle BackColor="#FFCC66" />
                <Items>
                    <asp:MenuItem Selected="True" Text="借用登記" Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="歸還" Value="1"></asp:MenuItem>   
                    <asp:MenuItem Text="學生管理" Value="2"></asp:MenuItem>
                    
                </Items>
                <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#FFCC66" />
            </asp:Menu>
        </div>
        <asp:Panel ID="Panel1" runat="server" Height="500px" Width="1476px" BackColor="#FEF7EB">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    器材借用登記<br />
                     
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="mId" DataValueField="mId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:器材借還系統ConnectionString %>" SelectCommand="SELECT [mId] FROM [Member]"></asp:SqlDataSource>
                <br />
                <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pNo" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-top: 0px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="pNo" HeaderText="財產編號" ReadOnly="True" SortExpression="pNo" />
                            <asp:BoundField DataField="pName" HeaderText="品名" SortExpression="pName" />
                            <asp:TemplateField><ItemTemplate><asp:CheckBox ID="CheckBox1" runat="server" BorderStyle="None" Visible="True" /></ItemTemplate></asp:TemplateField>
                            
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:器材借還系統ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="確認送出" />
                <br />
                </asp:View>
                

                <asp:View ID="View3" runat="server">
                    器材歸還<br /> 
                    選擇學號&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="mId" DataValueField="mId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:器材借還系統ConnectionString %>" SelectCommand="SELECT DISTINCT [mId] FROM [borrow]"></asp:SqlDataSource>
                    &nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="查詢" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField><ItemTemplate><asp:CheckBox ID="CheckBox2" runat="server" BorderStyle="None" Visible="True" /></ItemTemplate></asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="歸還" />
                    <br />
                    
                </asp:View>


                <asp:View ID="View4" runat="server">
                    學生管理<br /> 學號 
                    <asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                    &nbsp;&nbsp; 姓名 
                    <asp:TextBox ID="TextBox2" runat="server" Width="100px"></asp:TextBox>
                    &nbsp;&nbsp; 電話 
                    <asp:TextBox ID="TextBox3" runat="server" Width="140px"></asp:TextBox>
                    <br />
                    系級 
                    <asp:TextBox ID="TextBox4" runat="server" Width="300px"></asp:TextBox>
                    <br />
                    Email<asp:TextBox ID="TextBox5" runat="server" Width="280px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="新增" />
                    <br />
                    <br /> 

                    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="mId" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="mId" HeaderText="學號" ReadOnly="True" SortExpression="mId" />
                        <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                        <asp:BoundField DataField="phone" HeaderText="電話" SortExpression="phone" />
                        <asp:BoundField DataField="department" HeaderText="系級" SortExpression="department" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:器材借還系統ConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [mId] = @mId" SelectCommand="SELECT * FROM [Member]" UpdateCommand="UPDATE [Member] SET [name] = @name, [phone] = @phone, [department] = @department, [email] = @email WHERE [mId] = @mId">
                        <DeleteParameters>
                            <asp:Parameter Name="mId" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="mId" Type="String" />
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="phone" Type="Int32" />
                            <asp:Parameter Name="department" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="phone" Type="Int32" />
                            <asp:Parameter Name="department" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="mId" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                 <br />
                </asp:View>

               


            </asp:MultiView>
        </asp:Panel>
    </form>
</body>
</html>
