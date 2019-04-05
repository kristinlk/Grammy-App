<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Grammy_New3._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="div1" style="width: 218px; height: 120px; float:left; margin-left: 26px; margin-top: 25px;">
        <asp:Label ID="Label6" runat="server" Text="Search by:"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="241px" Height="77px">
            <asp:ListItem Selected="True" >Award Category and Year</asp:ListItem>
            <asp:ListItem>Artist</asp:ListItem>
            <asp:ListItem>Album</asp:ListItem>
            <asp:ListItem>Song</asp:ListItem>
            <asp:ListItem>Songwriter</asp:ListItem>
        </asp:RadioButtonList>


    </div>



    
    <p>
        &nbsp;</p>

    

    
        <div style="height: 78px; float: left; margin-top: 35px; top:0;" id="Category">
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                <asp:ListItem>Best New Artist</asp:ListItem>
                <asp:ListItem>Album of the Year</asp:ListItem>
                <asp:ListItem>Record of the Year</asp:ListItem>
                <asp:ListItem>Song of the Year</asp:ListItem>
                <asp:ListItem>Best Alternative Album</asp:ListItem>
                <asp:ListItem>Best Bluegrass Album</asp:ListItem>
                <asp:ListItem>Best Comedy Album</asp:ListItem>
                <asp:ListItem>Best Country Album</asp:ListItem>
                <asp:ListItem>Best Electronic Album</asp:ListItem>
                <asp:ListItem>Best Folk Album</asp:ListItem>
                <asp:ListItem>Best Gospel Album</asp:ListItem>
                <asp:ListItem>Best Jazz Album</asp:ListItem>
                <asp:ListItem>Best Latin Album</asp:ListItem>
                <asp:ListItem>Best New Age Album</asp:ListItem>
                <asp:ListItem>Best Pop Album</asp:ListItem>
                <asp:ListItem>Best R&amp;B Album</asp:ListItem>
                <asp:ListItem>Best Rap Album</asp:ListItem>
                <asp:ListItem>Best Reggae Album</asp:ListItem>
                <asp:ListItem>Best Rock Album</asp:ListItem>
                <asp:ListItem>Best World Music Album</asp:ListItem>


                <asp:ListItem>Best America Roots Song</asp:ListItem>
                <asp:ListItem>Best Country Song</asp:ListItem>
                <asp:ListItem>Best Rap Song</asp:ListItem>
                <asp:ListItem>Best R&amp;B Song</asp:ListItem>
                <asp:ListItem>Best Rock Song</asp:ListItem>


            </asp:DropDownList>
        </div>
        
        <div id="Year" style="float: left; width: 106px; height: 84px; margin-top: 35px;">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="year" DataValueField="year">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="select distinct year
from album_nomination
where (@DropDownList2 = 'Album of the Year' and genre_id = 1) 
or (@DropDownList2 = 'Best Alternative Album' and genre_id = 2) 
or (@DropDownList2 = 'Best Bluegrass Album' and genre_id = 4) 
or (@DropDownList2 = 'Best Comedy Album' and genre_id = 5) 
or (@DropDownList2 = 'Best Country Album' and genre_id = 6) 
or (@DropDownList2 = 'Best Electronic Album' and genre_id = 7)  
or (@DropDownList2 = 'Best Gospel Album' and genre_id = 8) 
or (@DropDownList2 = 'Best Folk Album' and genre_id = 9) 
or (@DropDownList2 = 'Best Jazz Album' and genre_id = 10)
or (@DropDownList2 = 'Best Latin Album' and genre_id = 11)  
or (@DropDownList2 = 'Best New Age Album' and genre_id = 12) 
or (@DropDownList2 = 'Best Pop Album' and genre_id = 13)  
or (@DropDownList2 = 'Best R&amp;B Album' and genre_id = 14)
or (@DropDownList2 = 'Best Rap Album' and genre_id = 15)
or (@DropDownList2 = 'Best Reggae Album' and genre_id = 16) 
or (@DropDownList2 = 'Best Rock Album' and genre_id = 17)  
or (@DropDownList2 = 'Best World Music Album' and genre_id = 18)
union 
select distinct year
from song_nomination
where (@DropDownList2 = 'Song of the Year' and genre_id = 1) 
or (@DropDownList2 = 'America Roots Song' and genre_id = 3) 
or (@DropDownList2 = 'Country Song' and genre_id = 6) 
or (@DropDownList2 = 'Best R&amp;B Song' and genre_id = 14) 
or (@DropDownList2 = 'Best Rap Song' and genre_id = 15) 
or (@DropDownList2 = 'Best Rock Song' and genre_id = 17) 
union 
select distinct year
from record_nomination
where (@DropDownList2 = 'Best New Record') 
union 
select distinct year
from artist_nomination
where (@DropDownList2 = 'Best New Artist') 
order by year">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="DropDownList2" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
    
        </div>

        <div style="height: 73px; width: 160px; margin-left: 0px; margin-top: 35px;">
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="artist_name" DataValueField="artist_name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="SELECT [artist_name] FROM [artist]"></asp:SqlDataSource>
    </div>

        <div style="height: 41px; width: 124px; float: left; margin-top: 35px;">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="89px" OnCommand ="Button1_Command" />
        </div>
    


    
 <div id ="album_by_year" style="height: 244px; width: 401px; bottom:0; margin-left: 221px; margin-top: 29px;">

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


        <asp:Label ID="Label7" runat="server" Text="<br> © 2019 - Developed by Kristin Kovarik and David Doellstedt"></asp:Label>

    </div>
    
 <div id ="artist_table" style="height: 244px; width: 401px; bottom:0; margin-left: 221px; margin-top: 29px;">

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="select distinct b.artist_name as &quot;Artist Name&quot;, a.year as &quot;Year&quot;, a.status as &quot;Won?&quot;, c.song_name as &quot;Song&quot;
 from record_nomination a, artist b, song c, song_artist f
where a.song_id = c.song_id
 and b.artist_name = @artist_name">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList3" Name="artist_name" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Artist Name" HeaderText="Artist Name" SortExpression="Artist Name" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Won?" HeaderText="Won?" SortExpression="Won?" />
            <asp:BoundField DataField="Song" HeaderText="Song" SortExpression="Song" />
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


        <asp:Label ID="Label1" runat="server" Text="<br> © 2019 - Developed by Kristin Kovarik and David Doellstedt"></asp:Label>

    </div>  

    <br />

</asp:Content>

