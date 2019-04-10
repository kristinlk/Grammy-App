<%@ Page Title="Search By Artist/Album/Song/Songwriter" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AAS2.aspx.cs" Inherits="Grammy_New3.AAS2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
            <p>&nbsp;</p>


        <div style="height: 24px; width: 100px;left: 150px; top:130px; position:absolute" id="Lab1">
        <asp:Label ID="Label3" runat="server" Text="Search by"></asp:Label>

    </div>

<div style="height: 24px; width: 193px; left: 150px; top:150px; position: absolute">

  <!--
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
                <asp:ListItem Value="Artist" Selected="True">Artist</asp:ListItem>
                <asp:ListItem Value="Album">Album</asp:ListItem>
                <asp:ListItem Value="Song">Song</asp:ListItem>
                <asp:ListItem Value="Songwriter">Songwriter</asp:ListItem>
            </asp:RadioButtonList>
       --> 
    <asp:DropDownList ID="DDL4" runat="server" AutoPostBack="True">
        <asp:ListItem>Artist</asp:ListItem>
        <asp:ListItem>Album</asp:ListItem>
        <asp:ListItem>Song</asp:ListItem>
        <asp:ListItem>Songwriter</asp:ListItem>
    </asp:DropDownList>
       
</div>


    <div style="height: 21px; width: 162px; top:150px; left:260px; position:absolute">
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" AutoPostBack="False" DataMember="DefaultView">

            
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="IF @DDL4 ='Artist'
select distinct artist_name from artist order by 1
ELSE IF @DDL4 =  'Album'
select album_name from album order by 1
ELSE IF @DDL4 = 'Song'
select distinct song_name from song order by 1
ELSE IF @DDL4 = 'Songwriter'
select composer_name from composer order by 1">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDL4" Name="DDL4" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

    </div>

    
    <div style="position:absolute; top:148px; left:557px; height:52px; width: 100px;">
            
        <asp:Button ID="Button1" runat="server" Text="Search" Height="25px" />
            
        </div>



    <div id ="output" style="height: 244px; width: 401px; left:150px; top: 200px; position: absolute;">




        <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="IF @DDL4 = 'Album'
select distinct d.album_name as &quot;Album Name&quot;, c.artist_name as &quot;Artist Name&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;,
case when e.genre_id = 1 then 'Album of the Year' when e.genre_id &gt; 1 then ('Best ' + e.genre_name + ' Album') end as &quot;Genre&quot;,
a.year as &quot;Year&quot;
from album_nomination a, album_artist b, artist c, album d, genre e
where a.album_id = b.album_id
and b.artist_id = c.artist_id
and b.album_id = d.album_id
and a.genre_id = e.genre_id
and d.album_name = @DropDownList3
order by 1,2
IF @DDL4 = 'Artist'
select b.artist_name as &quot;Artist&quot;, null as &quot;Name&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 'Best New Artist' as 'Genre', a.year as &quot;Year&quot;
from artist_nomination a, artist b
where a.artist_id = b.artist_id
and lower(b.artist_name) like lower('%' + @DropDownList3 + '%')
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
and lower(c.artist_name) like lower('%' + @DropDownList3 + '%')
union all
select d.artist_name as &quot;Artist&quot;, b.song_name as &quot;Name&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 'Record of the Year' as 'Genre', a.year as &quot;Year&quot;
from record_nomination a, song b, song_artist c, artist d
where a.song_id = c.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
and lower(d.artist_name) like lower('%' + @DropDownList3 + '%')
union all
select distinct d.artist_name as &quot;Artist&quot;, b.song_name as &quot;Name&quot;,  
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 
case when e.genre_id = 1 then 'Song of the Year' when e.genre_id &gt; 1 then ('Best ' + e.genre_name + ' Song') end as &quot;Genre&quot;,
a.year as &quot;Year&quot;
from song_nomination a, song b, song_artist c, artist d, genre e
where a.song_id = b.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
and a.genre_id = e.genre_id
and lower(d.artist_name) like lower('%' + @DropDownList3 + '%')
order by 5,4,2
IF @DDL4 = 'Song'
select b.song_name as &quot;Song&quot;, c.artist_name as &quot;Artist&quot;,  
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 'Record of the Year' as 'Genre', a.year as &quot;Year&quot;
from record_nomination a, song b, artist c
where a.song_id = b.song_id
and a.artist_id = c.artist_id
and b.song_name = @DropDownList3
union all
select distinct b.song_name as &quot;Song&quot;, c.artist_name as &quot;Artist&quot;, 
case when a.status = 'Y' then 'Yes' when a.status = 'N' then 'No' end as &quot;Won?&quot;, 
case when d.genre_id = 1 then 'Song of the Year' when d.genre_id &gt; 1 then ('Best ' + d.genre_name + ' Song') end as &quot;Genre&quot;,
a.year as &quot;Year&quot;
from song_nomination a, song b, artist c, genre d
where a.song_id = b.song_id
and a.artist_id = c.artist_id
and a.genre_id = d.genre_id
and b.song_name = @DropDownList3
order by 1,2
IF @DDL4 = 'Songwriter'
select distinct c1.song_name as &quot;Song Name&quot;, 
stuff((select distinct ',' + c.composer_name 
from song_nomination a, song_composer b, composer c, artist d
where a.song_id = b.song_id
and a.composer_id = b.composer_id
and a.artist_id = b.artist_id
and b.song_id = c1.song_id
and b.composer_id = c.composer_id
and b.artist_id = d.artist_id
and b.artist_id = d1.artist_id 
order by 1 
FOR XML PATH('')), 1, 1, '') as 'Songwriter',
d1.artist_name as 'Performing Artist',
case when a1.status = 'Y' then 'Yes' when a1.status = 'N' then 'No' end as 'Won?',
case when e1.genre_id = 1 then 'Song of the Year' when e1.genre_id &gt; 1 then ('Best ' + e1.genre_name + ' Song') end as &quot;Genre&quot;,
a1.year as &quot;Year&quot;
from song_nomination a1, song_composer b1, song c1, artist d1, genre e1
where a1.song_id = b1.song_id
and a1.composer_id = b1.composer_id
and a1.artist_id = b1.artist_id
and b1.song_id = c1.song_id
and b1.artist_id = d1.artist_id
and a1.genre_id = e1.genre_id
and a1.composer_id in (select composer_id from composer where lower(composer_name) like lower('%' + @DropDownList3 + '%'))
order by 6,2">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDL4" Name="DDL4" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList3" Name="DropDownList3" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>




        <asp:Label ID="Label1" runat="server" Text="<br> © 2019 - Developed by Kristin Kovarik and David Doellstedt"></asp:Label>
    </div>







  
</asp:Content>


