<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Grammy_New3._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    



    
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

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
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


    </div>
    
   

    <br />

</asp:Content>