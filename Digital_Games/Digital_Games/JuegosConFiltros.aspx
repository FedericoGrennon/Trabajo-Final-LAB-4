<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="JuegosConFiltros.aspx.cs" Inherits="Digital_Games.JuegosConFiltros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


<style>

    html {
      box-sizing: border-box;
    }

    *, *:before, *:after {
      box-sizing: inherit;
    }

    .column {
      float: left;
      width: 31%;
      margin-bottom: 50px;
      margin-left: 2%;
    }

    @media screen and (max-width: 300px) {
      .column {
        width: 100%;
        /*display: ;*/
      }
    }

    .card {
      box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.2);
    }

    .container {
      width: auto;
      color: white;
    }

    .container::after, .row::after {
      content: "";
      clear: both;
      display: table;
    }

    .title {
      color: white;
    }

    .button {
      border: none;
      outline: 0;
      display: inline-block;
      padding: 8px;
      color: white;
      background-color: #3a7e34;
      text-align: center;
      cursor: pointer;
      width: 100%;
    }

    .button:hover {
      background-color: #808080;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
  <div class="column">
    <div class="card">
      <img src="http://www.gamasutra.com/db_area/images/news/2016/Jun/275806/csgothumb.jpg" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Counter Strike Global Offensive</h2>
        <p class="title">Counter Strike Global Offensive</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        <p><button class="button">Ver Mas</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="https://eu.battle.net/support/static/images/games/tile_overwatch.7adf4d26.jpg" alt="Mike" style="width:100%">
      <div class="container">
        <h2>Overwatch</h2>
        <p class="title">Art Director</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        <p><button class="button">Ver Mas</button></p>
      </div>
    </div>
  </div>
  <div class="column">
    <div class="card">
      <img src="https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTcdg2UJZOIDSSshaPvjeWQgGVtK2FOHmLSHa2fvTqsCREDh2tmhNJPbEbzgtZqcHedH4SZ8Sfsp.3QARs5_C7pXArwWqajmr4Vk32lk7bnSlbZqfJIwo36EzqE8z77itrIGCbszjdFNdEoVTNF4InoQ1_yZ9MuhY.TJBUqa.Race8-&w=400&format=jpg" alt="John" style="width:100%">
      <div class="container">
        <h2>Rainbow Six Siege</h2>
        <p class="title">Designer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        <p><button class="button">Ver Mas</button></p>
      </div>
    </div>
  </div>
      <div class="column">
    <div class="card">
      <img src="https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTcdg2UJZOIDSSshaPvjeWQgGVtK2FOHmLSHa2fvTqsCREDh2tmhNJPbEbzgtZqcHedH4SZ8Sfsp.3QARs5_C7pXArwWqajmr4Vk32lk7bnSlbZqfJIwo36EzqE8z77itrIGCbszjdFNdEoVTNF4InoQ1_yZ9MuhY.TJBUqa.Race8-&w=400&format=jpg" alt="John" style="width:100%">
      <div class="container">
        <h2>Rainbow Six Siege</h2>
        <p class="title">Designer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        <p><button class="button">Ver Mas</button></p>
      </div>
    </div>
  </div>
      <div class="column">
    <div class="card">
      <img src="https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTcdg2UJZOIDSSshaPvjeWQgGVtK2FOHmLSHa2fvTqsCREDh2tmhNJPbEbzgtZqcHedH4SZ8Sfsp.3QARs5_C7pXArwWqajmr4Vk32lk7bnSlbZqfJIwo36EzqE8z77itrIGCbszjdFNdEoVTNF4InoQ1_yZ9MuhY.TJBUqa.Race8-&w=400&format=jpg" alt="John" style="width:100%">
      <div class="container">
        <h2>Rainbow Six Siege</h2>
        <p class="title">Designer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        <p><button class="button">Ver Mas</button></p>
      </div>
    </div>
  </div>
      <div class="column">
    <div class="card">
      <img src="https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTcdg2UJZOIDSSshaPvjeWQgGVtK2FOHmLSHa2fvTqsCREDh2tmhNJPbEbzgtZqcHedH4SZ8Sfsp.3QARs5_C7pXArwWqajmr4Vk32lk7bnSlbZqfJIwo36EzqE8z77itrIGCbszjdFNdEoVTNF4InoQ1_yZ9MuhY.TJBUqa.Race8-&w=400&format=jpg" alt="John" style="width:100%">
      <div class="container">
        <h2>Rainbow Six Siege</h2>
        <p class="title">Designer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        <p><button class="button">Ver Mas</button></p>
      </div>
    </div>
  </div>
</div>
</asp:Content>