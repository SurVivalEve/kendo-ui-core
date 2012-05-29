﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/DataViz.Master"
         Inherits="System.Web.Mvc.ViewPage<IEnumerable<ElectricityProduction>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="chart-wrapper">
    <%= Html.Kendo().Chart(Model)
        .Name("chart")
        .Title("Spain electricity production (GWh)")
        .Legend(legend => legend
            .Position(ChartLegendPosition.Top)
        )
        .DataSource(ds => ds.Read(read => read.Action("_SpainElectricity", "Chart")))
        .Series(series => {
            series.Line(model => model.Nuclear).Name("Nuclear");
            series.Line(model => model.Hydro).Name("Hydro");
            series.Line(model => model.Wind).Name("Wind");
        })
        .CategoryAxis(axis => axis
            .Categories(model => model.Year)
            .Labels(labels => labels.Rotation(-90))
        )
        .ValueAxis(axis => axis.Numeric()
            .Labels(labels => labels.Format("{0:N0}"))
            .MajorUnit(10000)
        )
        .Tooltip(tooltip => tooltip
            .Visible(true)
            .Format("{0:N0}")
        )
    %>
</div>
</asp:Content>
