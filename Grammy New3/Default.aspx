<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Grammy_New3._Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <p>
        &nbsp;</p>
    <asp:Label ID="Label1" runat="server" BorderStyle="None" Text="Best Album by Year"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="year" DataValueField="year">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="SELECT distinct year FROM album_nomination ORDER BY year"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Album Name" HeaderText="Album Name" SortExpression="Album Name" />
            <asp:BoundField DataField="Artist Name" HeaderText="Artist Name" SortExpression="Artist Name" />
            <asp:BoundField DataField="Won?" HeaderText="Won?" SortExpression="Won?" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="select distinct d.album_name as &quot;Album Name&quot;, c.artist_name as &quot;Artist Name&quot;, a.status as &quot;Won?&quot;
 from album_nomination a, album_artist b, artist c, album d, genre e
where a.album_id = b.album_id
and b.artist_id = c.artist_id
and b.album_id = d.album_id
and a.genre_id = '1'
 and a.year = @year">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="year" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>


