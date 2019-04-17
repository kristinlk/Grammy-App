<%@ Page Title="SampleReports" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SampleReports.aspx.cs" Inherits="Grammy_New3.SampleReports" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div style="position:absolute; left:50px; top:50px;">

<div style = "top:0px;">
        <h3>Most Total Awards/Nominations by Artist</h3>
    </div>

    <div>

    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource5" Width="1125px">
        <series>
            <asp:Series Name="Series1" XValueMember="Artist" YValueMembers="Total Nominations/Wins">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Interval="1" IsLabelAutoFit="False">
                    <LabelStyle Angle="45" />
                </AxisX>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="with artist_count as (
select b.artist_name as &quot;Artist&quot;
from artist_nomination a, artist b
where a.artist_id = b.artist_id
union all
select c.artist_name as &quot;Artist Name&quot;
from album_nomination a, album_artist b, artist c, album d, genre e
where a.album_id = b.album_id
and b.artist_id = c.artist_id
and b.album_id = d.album_id
and a.genre_id = e.genre_id
union all
select d.artist_name as &quot;Artist&quot;
from record_nomination a, song b, song_artist c, artist d
where a.song_id = c.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
union all
select distinct d.artist_name as &quot;Artist&quot;
from song_nomination a, song b, song_artist c, artist d, genre e
where a.song_id = b.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
and a.genre_id = e.genre_id
) 
select Artist, count(*) as &quot;Total Nominations/Wins&quot;
from  artist_count
where artist != 'Various artists'
group by artist
having count(*) &gt;= 10
order by 2 desc, 1"
        ></asp:SqlDataSource>
        </div>
        
    </div>

    <div style="position:absolute; left:50px; top:370px;">

    <div style = "top:0px;">
        <h3>So...Close... Most Nominations, with no Awards Won by Artist</h3>
    </div>

    <div>

    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource6" Width="1125px">
            <Series>
                <asp:Series Name="Series1" YValueMembers="Nominations" XValueMember="Artist">
                </asp:Series>
            </Series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Interval="1" IsLabelAutoFit="False">
                    <LabelStyle Angle="45" />
                </AxisX>
            </asp:ChartArea>
        </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="with artist_count as (
select b.artist_name as &quot;Artist&quot;, a.status as &quot;Status&quot;
from artist_nomination a, artist b
where a.artist_id = b.artist_id
union all
select c.artist_name as &quot;Artist Name&quot;, a.status as &quot;Status&quot;
from album_nomination a, album_artist b, artist c, album d, genre e
where a.album_id = b.album_id
and b.artist_id = c.artist_id
and b.album_id = d.album_id
and a.genre_id = e.genre_id
union all
select d.artist_name as &quot;Artist&quot;, a.status as &quot;Status&quot;
from record_nomination a, song b, song_artist c, artist d
where a.song_id = c.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
union all
select distinct d.artist_name as &quot;Artist&quot;, a.status as &quot;Status&quot;
from song_nomination a, song b, song_artist c, artist d, genre e
where a.song_id = b.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
and a.genre_id = e.genre_id
) 
select Artist, &quot;Nominations&quot; from (
select Artist, count(artist) as &quot;Total Nominations&quot;, 
sum(case when [Status] = 'Y' then 1 else 0 end) as &quot;Wins&quot;,
sum(case when [Status] = 'N' then 1 else 0 end) as &quot;Nominations&quot;
from  artist_count
group by artist
) as data
where Wins = 0
and Nominations &gt;= 5
order by 2 desc, 1"
            ></asp:SqlDataSource>
        </div>
    </div>

        <div style="position:absolute; left:50px; top:690px;">

            <div style = " top:0px;">
                <h3>Artist of the Decade (Most awards earned)</h3>
            </div>

            <div>
                
            <asp:Chart ID="Chart3" runat="server" Width="522px" DataSourceID="SqlDataSource7">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Decade | Artist" YValueMembers="Column1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Interval="1" IsLabelAutoFit="False">
                            <LabelStyle Angle="45" />
                        </AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

             <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:CIS_556ConnectionString %>" SelectCommand="with decade_count as (
select b.artist_name as &quot;Artist&quot;, a.status as &quot;Status&quot;, a.year as &quot;Yearrange&quot;
from artist_nomination a, artist b
where a.artist_id = b.artist_id
union all
select c.artist_name as &quot;Artist Name&quot;, a.status as &quot;Status&quot;, a.year as &quot;Yearrange&quot;
from album_nomination a, album_artist b, artist c, album d
where a.album_id = b.album_id
and b.artist_id = c.artist_id
and b.album_id = d.album_id
union all
select d.artist_name as &quot;Artist&quot;, a.status as &quot;Status&quot;, a.year as &quot;Yearrange&quot;
from record_nomination a, song b, song_artist c, artist d
where a.song_id = c.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
union all
select distinct d.artist_name as &quot;Artist&quot;, a.status as &quot;Status&quot;, a.year as &quot;Yearrange&quot;
from song_nomination a, song b, song_artist c, artist d
where a.song_id = b.song_id
and b.song_id = c.song_id
and c.artist_id = d.artist_id
) 
select CONCAT(Decade, SPACE(1) ,Artist) as &quot;Decade | Artist&quot;, max(&quot;Wins&quot;) from (
select Decade, Artist, sum(Wins) as &quot;Wins&quot;,ROW_NUMBER() OVER (PARTITION BY decade ORDER BY sum(Wins) DESC) AS yearcount from (
select artist, 
case 
when Yearrange like '195%' then '1950s'
when Yearrange like '196%' then '1960s'
when Yearrange like '197%' then '1970s'
when Yearrange like '198%' then '1980s'
when Yearrange like '199%' then '1990s'
when Yearrange like '200%' then '2000s'
when Yearrange like '201%' then '2010s'
end as &quot;Decade&quot;,
count(*) as &quot;Wins&quot;
from decade_count
where Status = 'Y'
and artist != 'Various artists'
group by artist, Yearrange
) as data
group by data.artist, data.decade
) as final
where yearcount = 1
group by final.Decade, final.artist
order by 1,2"></asp:SqlDataSource>
        </div>
        
    
    </div>

    
</asp:Content>
