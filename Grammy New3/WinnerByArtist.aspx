<%@ Page Title="WinnerByArtist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WinnerByArtist.aspx.cs" Inherits="Grammy_New3.WinnerByArtist" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource5" Width="1093px">
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
where Artist != 'Various artists'
group by artist
having count(*) &gt;= 10
order by 2 desc, 1"></asp:SqlDataSource>
    <p>
    </p>



</asp:Content>
