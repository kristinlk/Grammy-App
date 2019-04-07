<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Grammy_New3._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="div1" style="width: 218px; height: 120px; float:left; margin-left: 26px; margin-top: 25px;">
        <asp:Label ID="Label6" runat="server" Text="Search by:"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="241px" Height="77px">
            <asp:ListItem>Album</asp:ListItem>
            <asp:ListItem >Artist</asp:ListItem>
            <asp:ListItem>Song</asp:ListItem>
            <asp:ListItem>Songwriter</asp:ListItem>
        </asp:RadioButtonList>


    </div>



    
    <p>
        &nbsp;</p>

    

    
        <div style="height: 78px; float: left; margin-top: 35px; top:0;" id="Category">
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                <asp:ListItem>Album of the Year</asp:ListItem>
                <asp:ListItem>Artist of the Year</asp:ListItem>
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


                <asp:ListItem>Best American Roots Song</asp:ListItem>
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
or (@DropDownList2 = 'Best American Roots Song' and genre_id = 3) 
or (@DropDownList2 = 'Best Country Song' and genre_id = 6) 
or (@DropDownList2 = 'Best R&amp;B Song' and genre_id = 14) 
or (@DropDownList2 = 'Best Rap Song' and genre_id = 15) 
or (@DropDownList2 = 'Best Rock Song' and genre_id = 17) 
union 
select distinct year
from record_nomination
where (@DropDownList2 = 'Record of the Year') 
union 
select distinct year
from artist_nomination
where (@DropDownList2 = 'Artist of the Year') 
order by year">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="DropDownList2" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
    
        </div>

        <div style="height: 73px; width: 160px; margin-left: 0px; margin-top: 35px;">
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="artist_name" DataValueField="artist_name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="SELECT [artist_name] FROM [artist]">
            </asp:SqlDataSource>
    </div>

        <div style="height: 41px; width: 124px; float: left; margin-top: 35px;">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="89px" OnCommand ="Button1_Command" />
        </div>
    


    
 <div id ="album_by_year" style="height: 244px; width: 401px; bottom:0; margin-left: 221px; margin-top: 29px;">

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="IF @DropDownList2 like '%Album%'
select distinct d.album_name as &quot;Album Name&quot;, c.artist_name as &quot;Artist Name&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;
from album_nomination a, album_artist b, artist c, album d, genre e
where a.album_id = b.album_id
and b.artist_id = c.artist_id
and b.album_id = d.album_id
and a.genre_id = e.genre_id
and e.genre_id = case when @DropDownList2 = 'Album of the Year' then 1 
when @DropDownList2 = 'Best Alternative Album' then 2
when @DropDownList2 = 'Best Bluegrass Album' then 4
when @DropDownList2 = 'Best Comedy Album' then 5
when @DropDownList2 = 'Best Country Album' then 6
when @DropDownList2 = 'Best Electronic Album' then 7 
when @DropDownList2 = 'Best Gospel Album' then 8 
when @DropDownList2 = 'Best Folk Album' then 9
when @DropDownList2 = 'Best Jazz Album' then 10
when @DropDownList2 = 'Best Latin Album' then 11  
when @DropDownList2 = 'Best New Age Album' then 12
when @DropDownList2 = 'Best Pop Album' then 13 
when @DropDownList2 = 'Best R&amp;B Album' then 14
when @DropDownList2 = 'Best Rap Album' then 15
when @DropDownList2 = 'Best Reggae Album' then 16
when @DropDownList2 = 'Best Rock Album' then 17  
when @DropDownList2 = 'Best World Music Album' then 18
end
and @year = a.year
order by 1
ELSE IF @DropDownList2 like '%Song%'
select f.composer_name as &quot;Composer&quot;, e.song_name as &quot;Song Name&quot;, d.artist_name as &quot;Performing Artist&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;
from song_nomination a, song_artist as b, song_composer c, artist d, song e, composer f, genre g
where a.song_id = b.song_id
and b.artist_id = d.artist_id
and b.song_id = e.song_id
and c.song_id = e.song_id
and c.composer_id = f.composer_id
and a.genre_id = g.genre_id
and g.genre_id = case when @DropDownList2 = 'Song of the Year' then 1 
when @DropDownList2 = 'Best American Roots Song' then 3 
when @DropDownList2 = 'Best Country Song' then 6
when @DropDownList2 = 'Best R&amp;B Song' then 14
when @DropDownList2 = 'Best Rap Song' then 15 
when @DropDownList2 = 'Best Rock Song' then 17
end 
and @year = a.year
order by 2,1
ELSE IF @DropDownList2 = 'Record of the Year'
select c.song_name as &quot;Song Name&quot;, d.artist_name as &quot;Artist&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;
from record_nomination a, song_artist b, song c, artist d
where a.song_id = b.song_id
and b.song_id = c.song_id
and b.artist_id = d.artist_id
and @year = a.year
order by 1
ELSE IF @DropDownList2 = 'Artist of the Year'
select d.artist_name as &quot;Artist&quot;,
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;
from artist_nomination a, artist d
LEFT JOIN song_artist b on d.artist_id = b.artist_id
LEFT JOIN album_artist c on d.artist_id = c.artist_id
where a.artist_id = d.artist_id
and @year = a.year
order by 1">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="DropDownList2" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList1" Name="year" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Album Name" HeaderText="Album Name" SortExpression="Album Name" />
            <asp:BoundField DataField="Artist Name" HeaderText="Artist Name" SortExpression="Artist Name" />
            <asp:BoundField DataField="Won?" HeaderText="Won?" SortExpression="Won?" ReadOnly="True" />
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


    </div>
    
 <div id ="artist_table" style="height: 244px; width: 401px; bottom:0; margin-left: 221px; margin-top: 29px;">

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="IF @RadioButtonList1 = 'Album'
select distinct d.album_name as &quot;Album Name&quot;, c.artist_name as &quot;Artist Name&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;,
case when e.genre_id = 1 then 'Album of the Year' when e.genre_id &gt; 1 then e.genre_name end as &quot;Genre&quot;,
a.year as &quot;Year&quot;
from album_nomination a, album_artist b, artist c, album d, genre e
where a.album_id = b.album_id
and b.artist_id = c.artist_id
and b.album_id = d.album_id
and a.genre_id = e.genre_id
and d.album_name = @DropDownList3
order by 1,2
IF @RadioButtonList1 = 'Artist'
select b.artist_name as &quot;Artist&quot;, null as &quot;Name&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 'Best New Artist' as 'Genre', a.year as &quot;Year&quot;
from artist_nomination a, artist b
where a.artist_id = b.artist_id
and b.artist_name = @DropDownList3
union all
select c.artist_name as &quot;Artist Name&quot;, d.album_name as &quot;Name&quot;,  
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;,
case when e.genre_id = 1 then 'Album of the Year' when e.genre_id &gt; 1 then ('Best ' + e.genre_name + ' Album') end as &quot;Genre&quot;,
a.year as &quot;Year&quot;
from album_nomination a, album_artist b, artist c, album d, genre e
where a.album_id = b.album_id
and b.artist_id = c.artist_id
and b.album_id = d.album_id
and a.genre_id = e.genre_id
and c.artist_name = @DropDownList3
union all
select d.artist_name as &quot;Artist&quot;, b.song_name as &quot;Name&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 'Record of the Year' as 'Genre', a.year as &quot;Year&quot;
from record_nomination a, song b, song_artist c, artist d
where a.song_id = c.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
and d.artist_name = @DropDownList3
union all
select d.artist_name as &quot;Artist&quot;, b.song_name as &quot;Name&quot;,  
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 
case when e.genre_id = 1 then 'Song of the Year' when e.genre_id &gt; 1 then ('Best ' + e.genre_name + ' Song') end as &quot;Genre&quot;,
a.year as &quot;Year&quot;
from song_nomination a, song b, song_artist c, artist d, genre e
where a.song_id = b.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
and a.genre_id = e.genre_id
and d.artist_name = @DropDownList3
order by 5,4,2
IF @RadioButtonList1 = 'Song'
select distinct b.song_name as &quot;Song&quot;, d.artist_name as &quot;Artist&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 'Record of the Year' as 'Genre', a.year as &quot;Year&quot;
from record_nomination a, song b, song_artist c, artist d
where a.song_id = c.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
and b.song_name = @DropDownList3
union all
select distinct b.song_name as &quot;Song&quot;, d.artist_name as &quot;Artist&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 
case when e.genre_id = 1 then 'Song of the Year' when e.genre_id &gt; 1 then e.genre_name end as &quot;Genre&quot;,
a.year as &quot;Year&quot;
from song_nomination a, song b, song_artist c, artist d, genre e
where a.song_id = b.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
and a.genre_id = e.genre_id
and b.song_name = @DropDownList3
order by 1,2
IF @RadioButtonList1 = 'Songwriter'
select distinct d.composer_name as &quot;Composer Name&quot;, c.song_name, f.artist_name as &quot;Performing Artist&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;,
case when g.genre_id = 1 then 'Song of the Year' when g.genre_id &gt; 1 then g.genre_name end as &quot;Genre&quot;,
a.year as &quot;Year&quot;
from song_nomination a, song_composer b, song c, composer d, song_artist e, artist f, genre g
where a.song_id = c.song_id
and b.composer_id = d.composer_id
and b.song_id = c.song_id
and e.song_id = c.song_id
and e.artist_id = f.artist_id
and a.genre_id = g.genre_id
and d.composer_name = @DropDownList3
order by 6,2">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="RadioButtonList1" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList3" Name="DropDownList3" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Album Name" HeaderText="Album Name" SortExpression="Album Name" />
            <asp:BoundField DataField="Artist Name" HeaderText="Artist Name" SortExpression="Artist Name" />
            <asp:BoundField DataField="Won?" HeaderText="Won?" SortExpression="Won?" ReadOnly="True" />
            <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" ReadOnly="True" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
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